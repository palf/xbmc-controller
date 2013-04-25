require 'webmock/rspec'
require 'xbmc/client'


describe XBMC::Client do

  def stub_post(status=200, body={})
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
    context 'given the request is valid' do
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

      it 'fails if cant find an xbmc instance' do
        lambda {
          client.send_command('test')
        }.should raise_error()
      end
    end
  end
end
