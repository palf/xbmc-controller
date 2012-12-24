Given /^the server root is '(http:\/\/.+)'$/ do |root|
	@server_root = root
end

Given /^I start the server$/ do
	start_server
end

When /^I navigate to '(\/.*)'$/ do |path|
	@response = HTTParty.get(path)
end


When /^I post (.+) to '(\/.*)'$/ do |content, path|
	@response = HTTParty.post(path, :body => content)
end

