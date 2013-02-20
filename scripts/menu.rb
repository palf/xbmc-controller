require 'highline'

require './lib/xbmc/control'
require './lib/xbmc/method'


include XBMC::Control


@data = send_command('JSONRPC.Introspect').parsed_response['result']
@types = @data['types']
@methods = {}

@data['methods'].each { |raw_method|
  method = XBMC::Method.from_xbmc(raw_method)
  @methods[method.group] ||= []
  @methods[method.group] << method
}  



def select_from(set)
  answer = set
  until answer.is_a? XBMC::Method
    answer = make_menu(answer)
  end
  answer
end


def make_menu(set)
  if set.is_a? Hash
    a = @high.choose(*set.keys)
    set[a]
  elsif set.is_a? Array
    @high.choose(*set)
  else
    raise
  end
end
    
    
    
   
@high = HighLine.new()
m = select_from(@methods)



class XBMC::Type
  def validate(answer)
    true
  end
end



def validate(value, type_def)
  return value if type_def.nil?
  type = type_def['type']
  if type.is_a? Array
    type.each { |x|
      value = convert(value, x['type'])
    }
  else
    value = convert(value, type)
  end
  value
end



def convert(value, type)
  return value if !value.is_a? String
  case type
    when 'integer'
      value = value.to_i
      
    when 'boolean'
      value = (value == 'true') 
 
    when 'array'
      value = value.split(',')
    
    else
      value
    
  end  
  value
end



def run(method)
  params = {}
  method.required.each { |required_param|
    p required_param
    name = required_param['name']
    type_def = (@types[required_param['$ref']])
    p "TYPE DEF : #{type_def}"
    value = @high.ask('Enter a value for : ' + name)
    value = validate(value, type_def)
    params[name] = value
  }
  r = do_command(method, params)
  raise r.to_s if r['error']
  r['result']
end


p run(m)


