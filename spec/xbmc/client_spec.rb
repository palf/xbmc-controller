require 'webmock/rspec'

require 'xbmc/client'


describe XBMC::Client do

  describe '#initialize' do
    it 'appends /jsonrpc to the server url automatically' do
      stub_request(:post, "http://xbmc.server:8080/jsonrpc").
        to_return(:status => 200, :body => nil)

      XBMC::Client.new('http://xbmc.server:8080').introspect()
      assert_requested(:post, 'http://xbmc.server:8080/jsonrpc')
    end
  end

  describe '#send_command' do
    it 'builds a request body containing the method name and parameters' do
      stub_request(:post, "http://xbmc.server:8080/jsonrpc").
        to_return(:status => 200, :body => nil)

      expected_body = {:jsonrpc => '2.0', :id => 1, :method => 'test', :params => {}}.to_json

      XBMC::Client.new('http://xbmc.server:8080').send_command('test')
      a_request(:post, 'http://xbmc.server:8080/jsonrpc').with(:body => expected_body).should have_been_made
    end

    it 'adds headers to specify json content' do
      stub_request(:post, "http://xbmc.server:8080/jsonrpc").
        to_return(:status => 200, :body => nil)

      expected_header = {'Content-Type' => 'application/json'}

      XBMC::Client.new('http://xbmc.server:8080').send_command('test')
      a_request(:post, 'http://xbmc.server:8080/jsonrpc').with(:header => expected_header).should have_been_made
    end

    it 'posts to the configured server url' do
      stub_request(:post, "http://xbmc.server:8080/jsonrpc").
        to_return(:status => 200, :body => nil)

      XBMC::Client.new('http://xbmc.server:8080').send_command('test')
      a_request(:post, 'http://xbmc.server:8080/jsonrpc').should have_been_made
    end

    it 'returns the parsed response as an object' do
      dummy_object = {'name' => 'addonid', 'type' => 'string'}
      stub_request(:post, "http://xbmc.server:8080/jsonrpc").
        to_return(:status => 200, :body => dummy_object.to_json, :headers => {'content-type' => 'application/json'})

      response = XBMC::Client.new('http://xbmc.server:8080').send_command('test')
      response.should be_a(Hash), "response was a #{response.class}"
      response.should == dummy_object
    end
  end

  describe '#introspect' do
    it 'passes JSONRPC.Introspect as a method name' do
      stub_request(:post, "http://xbmc.server:8080/jsonrpc").
        to_return(:status => 200, :body => nil)

      expected_body = {:jsonrpc => '2.0', :id => 1, :method => 'JSONRPC.Introspect', :params => {}}.to_json

      XBMC::Client.new('http://xbmc.server:8080').introspect()
      a_request(:post, 'http://xbmc.server:8080/jsonrpc').with(:body => expected_body).should have_been_made

    end
  end

end
