require 'rubygems'
require 'httparty'
require 'json'


module XBMC
	class Controller


		def init(xbmc_url)
			@xbmc_url = xbmc_url
			#@xbmc ||= 'http://localhost:7001/jsonrpc'
			#@xbmc ||= 'http://192.168.1.76/jsonrpc'
			#@xbmc ||= 'http://openelec/jsonrpc'
		end


		def headers
			@headers ||= {'content-type' => 'application/json'}
		end


		def introspect()
			response = HTTParty.get(@xbmc_url, :body => build_request_body('JSONRPC.Introspect', {}), :headers => headers)
			response.parsed_response
		end


		def send_command(method, params = {})
			body = build_request_body(method, params)
			HTTParty.post(xbmc, :body => body, :headers => headers)
		end


		def do_command(method, params = {})
			command = method.group + '.' + method.command
			response = send_command(command, params)
			response.parsed_response
		end


		def build_request_body(method, params)
			{
					:jsonrpc => '2.0',
					:id => 1,
					:method => method,
					:params => params
			}.to_json
		end

	end
end