class XBMCMock < BDDServer::HandlerBase
 def call(env)
    request = ::Rack::Request.new(env)
    header = {'content-type' => 'application/json'}
    body = {:id => 1, :jsonrpc => "2.0", :result => 'pong' }.to_json
    [200, header, body]
  end
end
