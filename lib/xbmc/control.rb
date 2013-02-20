require 'rubygems'
require 'httparty'
require 'json'


module XBMC
  module Control
  
	def xbmc 
		@xbmc ||= 'http://localhost:8081/jsonrpc'
#		@xbmc ||= 'http://192.168.1.76/jsonrpc'
#		@xbmc ||= 'http://openelec/jsonrpc'
	end
	
	
	def headers
		@headers ||= {'content-type' => 'application/json'}
	end
	
	
	def xbmc_get(body = nil)
		#HTTParty.get(xbmc, :headers => headers)
		
		r = HTTParty.get(xbmc, :body => get_body('JSONRPC.Introspect', {}), :headers => headers)
		p r.parsed_response
		r
	end
	
	
	def send_command(method, params = {})
		body = get_body(method, params)
		HTTParty.post(xbmc, :body => body, :headers => headers)
	end
	
	
	def do_command(method, params = {})
	  command = method.group + '.' + method.command
	  response = send_command(command, params)
	  response.parsed_response
	end
	
	
	def get_body(method, params)
		{
			:jsonrpc => '2.0',
			:id => 1,
			:method => method,
			:params => params
		}.to_json
	end

  end
end
