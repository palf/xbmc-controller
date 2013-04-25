require 'rubygems'
require 'httparty'
require 'json'


module XBMC
	class Client

		def initialize(xbmc_url)
			@xbmc_url = xbmc_url + '/jsonrpc'
		end

		def send_command(method, params = {})
			response = make_request(method, params)
			result = parse_response(response)
		end

		def parse_response(response)
			if response.code == 200
				body = response.parsed_response
				if body.has_key?('result')
					body['result']
				elsif body.has_key?('error')
					body['error']
				end
			else
				raise "http error : #{response.code}"
			end
		end

		def make_request(method, params)
			body = build_request_body(method, params)
			headers = {'content-type' => 'application/json'}
			begin
				HTTParty.post(@xbmc_url, :body => body, :headers => headers)
			rescue
				raise 'http error'
			end
		end

		def ping()
			send_command('JSONRPC.Ping', {})
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
