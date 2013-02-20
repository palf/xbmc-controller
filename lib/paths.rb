require './lib/tv_shows'

module JackTest
	def self.call(env)
#		params = Rack::Request.new(env).params
#		p params.methods.sort - Object.methods
		request = Rack::Request.new(env)
		body = nil
		
		system 'ruby ./scripts/youtube.rb' if request.get?
#[404, {}, []]		
		[200, {'Content-Type' => 'text/plain'}, [body]]
#		 'application/json'
	end
end





def respond_with_text(body)
	[200,
	{
		'Content-Type' => 'text/plain',
		'Content-Length' => body.length
	},
		[body]
	]
end

