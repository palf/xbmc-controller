require 'highline'

require './lib/xbmc/method'


module XBMC
	class Menu

		def start(xbmc)
			@data = xbmc.send_command('JSONRPC.Introspect').parsed_response['result']
			@types = @data['types']
			@methods = {}

			@data['methods'].each { |raw_method|
				method = XBMC::Method.from_json(raw_method)
				@methods[method.group] ||= []
				@methods[method.group] << method
			}


			@high = HighLine.new()
			m = select_from(@methods)

			p run(m)
		end


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
				raise "expected Hash or Array; got #{set.class}"
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
					value.each { |x| x.strip! }

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


	end
end
