class XBMCMock < BDDServer::HandlerBase
  def call(env)
    request = ::Rack::Request.new(env)
    if request.post?
      @last_post = JSON.parse(request.body.read)
    end
    header = {'content-type' => 'application/json'}
    body = {:id => 1, :jsonrpc => "2.0", :result => 'pong' }.to_json
    [200, header, body]
  end

  def has_received?(value)
    @last_post['method'] == value
  end

  def last_method()
    @last_post['method']
  end
end
