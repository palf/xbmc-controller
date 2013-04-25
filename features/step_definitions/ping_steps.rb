When(/^XBMC is not running$/) do
  warn 'no-op'
end

When(/^XBMC is running at 'http:\/\/localhost:(\d+)'$/) do |port|
  xbmc_mock = XBMCMock.new()
  start_server(port) do |config|
    config.map('/') { run(xbmc_mock) }
  end
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

