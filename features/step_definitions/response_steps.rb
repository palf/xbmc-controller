Then /^the response is '(.+)'$/ do |expected|
	@response.body.should == expected
end

