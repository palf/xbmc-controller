require 'xbmc/client'
require 'xbmc/method'
require 'xbmc/menu'
require 'xbmc/player'
require 'xbmc/playlist'


module XBMC

  def self.connect(server)
    client = create_client(server)
    introspection = run_introspect(client)
    run_converter(introspection)
  end


  def self.create_client(server)
    XBMC::Client.new(server)
  end

  def self.run_introspect(client)
    client.introspect()
  end

end
