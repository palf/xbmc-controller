module XBMC
  class Controller
    def initialize(location)
      @client = XBMC::Client.new(location)
      @player = XBMC::Player.new(@client)
      @playlist = XBMC::Playlist.new(@client)
    end

    def play(link)
      p @playlist.clear()
      p @playlist.add(link)
      p @player.stop()
      p @player.open(@playlist)
    end
  end
end
