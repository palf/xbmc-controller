require 'xbmc/client'
require 'xbmc/method'
require 'xbmc/menu'
require 'xbmc/player'
require 'xbmc/playlist'
require 'xbmc/input'


module XBMC

  def self.connect(server)
    client = XBMC::Client.new(server)
    introspection = client.introspect()
    run_converter(introspection)
  end

end
