When(/^the XBMC mock is not running$/) do
  warn 'no-op'
end

When(/^the XBMC mock is running at 'http:\/\/localhost:(\d+)'$/) do |port|
  xbmc_mock = XBMCMock.new()
  @xbmc_mock = xbmc_mock
  start_server(port) do |config|
    config.map('/') { run(xbmc_mock) }
  end
end

When(/^the XBMC mock is returning the correct response for 'ping'$/) do
  warn 'no-op'
end

When(/^the XBMC mock receives the method '(.+)'$/) do |method|
  @actions.shift.call()
  @xbmc_mock.last_method.should == method
end


When(/^the client is configured at '(.+)'$/) do |path|
  @client = XBMC::Client.new(path)
end

When(/^I call the ping method$/) do
  @actions << lambda { @client.ping() }
end

When(/^I call the '(.+)' method$/) do |method|
  @actions << lambda { @client.send_command(method) }
end

When(/^I get the response '(.+)'$/) do |response|
  result = @actions.shift().call
  result.should == response
end

When(/^an error is raised$/) do
  @actions.shift().should raise_error
end

