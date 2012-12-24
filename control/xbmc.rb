require 'rubygems'
require 'httparty'
require 'json'


module XBMC

	def xbmc 
		@xbmc ||= 'http://192.168.1.76/jsonrpc'
	end
	
	
	def headers
		@headers ||= {'content-type' => 'application/json'}
	end
	
	
	def xbmc_get(body = nil)
		HTTParty.get(xbmc, :headers => headers)
	end
	
	
	def send_command(method, params = {})
		body = get_body(method, params)
		HTTParty.post(@xbmc, :body => body, :headers => headers)
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
