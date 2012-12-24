require './lib/tv_shows'

module JackTest
	def self.call(env)
		params = Rack::Request.new(env).params
		body = 'fish'
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

