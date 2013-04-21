require 'webmock/rspec'
require 'xbmc/client'


describe XBMC::Client do

  def stub_post(status=200, body=nil)
    stub_request(:post, "#{server}/jsonrpc").to_return(
      :status => status,
      :body => body.to_json,
      :headers => {'content-type' => 'application/json'}
    )
  end

  def stub_missing()
    stub_request(:post, "#{server}/jsonrpc").to_raise(ConnectionError)
  end


  let(:server) { 'http://xbmc.server:8080' }
  let(:client) { XBMC::Client.new(server) }


  describe '#send_command' do
    it 'posts to the configured server url' do
      stub_post()
      client.send_command('test')
      a_request(:post, "#{server}/jsonrpc").should have_been_made
    end

    it 'builds a request body containing the method name and parameters' do
      stub_post()
      expected_body = {:jsonrpc => '2.0', :id => 1, :method => 'test', :params => {}}.to_json
      client.send_command('test')
      a_request(:post, "#{server}/jsonrpc").with(:body => expected_body).should have_been_made
    end

    it 'adds headers to specify json content' do
      stub_post()
      expected_header = {'Content-Type' => 'application/json'}
      client.send_command('test')
      a_request(:post, "#{server}/jsonrpc").with(:header => expected_header).should have_been_made
    end

    it 'returns the parsed response as an object' do
      dummy_object = {'name' => 'addonid', 'type' => 'string'}
      stub_post(200, dummy_object)

      response = client.send_command('test')
      response.should be_a(Hash), "response was a #{response.class}"
      response.should == dummy_object
    end

    it 'fails if cant find an xbmc instance' do
      # stub_missing()
      lambda {
        client.send_command('test')
      }.should raise_error()
    end


  end


  describe '#ping' do
    it 'appends /jsonrpc to the server url automatically' do
      stub_post()
      expected_body = {:jsonrpc => '2.0', :id => 1, :method => 'JSONRPC.Ping', :params => {}}.to_json
      client.ping()
      a_request(:post, "#{server}/jsonrpc").with(:body => expected_body).should have_been_made
    end
  end


  describe '#introspect' do
    it 'passes JSONRPC.Introspect as a method name' do
      stub_post()
      expected_body = {:jsonrpc => '2.0', :id => 1, :method => 'JSONRPC.Introspect', :params => {}}.to_json
      client.introspect()
      a_request(:post, "#{server}/jsonrpc").with(:body => expected_body).should have_been_made
    end
  end

end
