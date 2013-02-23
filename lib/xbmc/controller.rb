require 'rubygems'
require 'httparty'
require 'json'


module XBMC
	class Controller

		def initialize(xbmc_url)
			@xbmc_url = xbmc_url + '/jsonrpc'
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
			HTTParty.post(@xbmc_url, :body => body, :headers => headers)
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
