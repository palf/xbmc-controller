require 'httparty'
require 'rack'

module ServerHelpers

	def start_server(root = 'http://localhost:3001')
		@port = 3001
		@root = root
		config = build_config()
		launch_server(config)
	end

	def stop_server()
		!!@server_thread && @server_thread.exit
	end

	private

	def launch_server(app)
		delay = 0.2
		
		@server_thread = Thread.new() {
			Rack::Handler::Thin.run(app, {:Port => @port}) do |server|
			Thin::Logging.silent = true
			end
		}

		Timeout::timeout(1) {
			until server_is_running? do
				sleep(delay)
			end
		}
	end

	def server_is_running?()
		begin
			HTTParty.get(@root)
			true
		rescue
			false
		end
	end

	def build_config()
		app, options = Rack::Builder.parse_file('config.ru')
		app
	end
end

