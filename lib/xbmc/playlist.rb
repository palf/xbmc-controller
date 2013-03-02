
module XBMC
  class Playlist
    attr_reader :playlist_id

    def initialize(controller)
      @controller = controller
      @playlist_id = 1
    end

    def clear()
      @controller.send_command('Playlist.Clear', {:playlistid => @playlist_id})
    end

    def add(file)
      @controller.send_command('Playlist.Add', {:playlistid => @playlist_id, :item => {:file => file}})
    end
  end
end
