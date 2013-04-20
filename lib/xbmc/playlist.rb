module XBMC
  class Playlist
    attr_reader :playlist_id

    def initialize(controller)
      @controller = controller
      @playlist_id = 1
    end

    def add(file)
      args = {:playlistid => @playlist_id, :item => {:file => file}}
      @controller.send_command('Playlist.Add', args)
    end

    def clear()
      args = {:playlistid => @playlist_id}
      @controller.send_command('Playlist.Clear', args)
    end

    def get_items(properties=nil, limits=nil, sort=nil)
      args = {:playlistid => @playlist_id}
      @controller.send_command('Playlist.GetItems', args)
    end

    def get_playlists()
      args = {}
      @controller.send_command('Playlist.GetPlaylists', args)
    end

    def get_properties(properties=[])
      # properties must be an array containing only 'type' and/or 'size'
      args = {:playlistid => @playlist_id, :properties => properties}
      @controller.send_command('Playlist.GetProperties', args)
    end

    def insert(position, item)
      args = {:playlistid => @playlist_id, :position => position, :item => item}
      @controller.send_command('Playlist.Insert', args)
    end

    def remove(position)
      args = {:playlistid => @playlist_id, :position => position}
      @controller.send_command('Playlist.Remove', args)
    end

    def swap(position1, position2)
      args = {:playlistid => @playlist_id, :position1 => position1, :position2 => position2}
      @controller.send_command('Playlist.Swap', args)
    end

  end
end
