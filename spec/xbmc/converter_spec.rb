# require './lib/xbmc/converter'



# def no_params()
#   {
#     "description" => "Quit application",
#     "params" => [],
#     "returns" => {
#       "type" => "string"
#     },
#     "type" => "method"
#   }
# end


# describe XBMC::Converter do

#   context 'when given no params' do
#     it 'creates a description property' do
#       parsed_response = no_params
#       converter = XBMC::Converter.new()
#       result = converter.convert(parsed_response)

#       result.description.should == 'Quit application'
#     end

#     it 'takes no arguments' do
#       parsed_response = no_params
#       converter = XBMC::Converter.new()
#       result = converter.convert(parsed_response)

#       result.arguments.should == []
#     end

#     it 'returns a string' do
#       parsed_response = no_params
#       converter = XBMC::Converter.new()
#       result = converter.convert(parsed_response)

#       result.return_type.should == 'string'
#     end
#   end

# end
