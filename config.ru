require './lib/paths'

use Rack::CommonLogger


map '/test' do
  run JackTest
end


#map '/tv_shows' do
  #run TVShows
 run Rack::Directory.new('./source')

#end

