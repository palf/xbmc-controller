
module XBMC
  class Playlist
    attr_reader :playlist_id

    def initialize(controller)
      @controller = controller
      @playlist_id = 1
    end

    def add(file)
      args = {:playlistid => @playlist_id, :item => {:file => file}}
      response = @controller.send_command('Playlist.Add', args)
      response.parsed_response
    end

    def clear()
      args = {:playlistid => @playlist_id}
      response = @controller.send_command('Playlist.Clear', args)
      response.parsed_response
    end

    def get_items(properties=nil, limits=nil, sort=nil)
      args = {:playlistid => @playlist_id}
      response = @controller.send_command('Playlist.GetItems', args)
      response.parsed_response
    end

    def get_playlists()
      args = {}
      response = @controller.send_command('Playlist.GetPlaylists', args)
      response.parsed_response
    end

    def get_properties(properties=[])
      # properties must be an array containing only 'type' and/or 'size'
      args = {:playlistid => @playlist_id, :properties => properties}
      response = @controller.send_command('Playlist.GetProperties', args)
      response.parsed_response
    end

    def insert(position, item)
      args = {:playlistid => @playlist_id, :position => position, :item => item}
      response = @controller.send_command('Playlist.Insert', args)
      response.parsed_response
    end

    def remove(position)
      args = {:playlistid => @playlist_id, :position => position}
      response = @controller.send_command('Playlist.Remove', args)
      response.parsed_response
    end

    def swap(position1, position2)
      args = {:playlistid => @playlist_id, :position1 => position1, :position2 => position2}
      response = @controller.send_command('Playlist.Swap', args)
      response.parsed_response
    end

  end
end
