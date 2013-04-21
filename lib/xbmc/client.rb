require 'rubygems'
require 'httparty'
require 'json'


module XBMC
	class Client

		def initialize(xbmc_url)
			@xbmc_url = xbmc_url + '/jsonrpc'
		end

		def send_command(method, params = {})
			body = build_request_body(method, params)
			headers = {'content-type' => 'application/json'}
			response = HTTParty.post(@xbmc_url, :body => body, :headers => headers)
			if response.code == 200
				response.parsed_response
			else
				raise "http error : #{response.code}"
			end
		end

		def introspect()
			send_command('JSONRPC.Introspect', {})
		end

		private

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
