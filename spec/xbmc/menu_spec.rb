require './lib/xbmc/menu'


describe XBMC::Menu do


	context :convert do

		it "returns immediately if passed something that is not a string (nil)" do
			menu = XBMC::Menu.new()
			menu.convert(nil, 'boolean').should be_nil
		end


		it "returns immediately if passed something that is not a string (an integer)" do
			menu = XBMC::Menu.new()
			menu.convert(0, 'boolean').should == 0

		end


		it "returns immediately if passed something that is not a string (an array)" do
			menu = XBMC::Menu.new()
			menu.convert([], 'boolean').should == []
		end


		it "converts the string 'true' to the boolean true" do
			menu = XBMC::Menu.new()
			menu.convert('true', 'boolean').should be_true
		end


		it "converts the string 'false' to the boolean false" do
			menu = XBMC::Menu.new()
			menu.convert('false', 'boolean').should be_false
		end


		it "returns an integer of the input if type is 'integer'" do
			menu = XBMC::Menu.new()
			menu.convert('3', 'integer').should == 3
			menu.convert('44', 'integer').should == 44
			menu.convert('555', 'integer').should == 555
		end


		it 'converts a comma-delimited list into an array' do
			menu = XBMC::Menu.new()
			menu.convert('', 'array').should == []
			menu.convert('one', 'array').should == ['one']
			menu.convert('one, two', 'array').should == ['one', 'two']
		end


		it 'returns the input if type is not specified' do
			menu = XBMC::Menu.new()
			menu.convert('fish', nil).should == 'fish'
		end


		it "returns the input if type is not one of integer/boolean/array" do
			menu = XBMC::Menu.new()
			menu.convert('content', 'fish').should == 'content'
		end

	end

end
