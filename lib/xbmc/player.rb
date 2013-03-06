
module XBMC
  class Player
    def initialize(controller)
      @controller = controller
      @player_id = 1
    end

    def get_active_players()
      response = @controller.send_command('Player.GetActivePlayers')
      response.parsed_response
    end

    def get_item()
      args = {:playerid => @player_id}
      response = @controller.send_command('Player.GetItem', args)
      response.parsed_response
    end

    def get_properties()
      args = {:playerid => @player_id}
      response = @controller.send_command('Player.GetProperties', args)
      response.parsed_response
    end

    def go_to()
      args = {:playerid => @player_id}
      response = @controller.send_command('Player.GoTo', args)
      response.parsed_response
    end

    def move()
      args = {:playerid => @player_id}
      response = @controller.send_command('Player.Move', args)
      response.parsed_response
    end

    def open(item)
      #item = {:playlistid => playlist.playlist_id, :position => 0}
      args = {:item => item}
      response = @controller.send_command('Player.Open', args)
      response.parsed_response
    end

    def play_pause()
      args = {:playerid => @player_id}
      response = @controller.send_command('Player.PlayPause', args)
      response.parsed_response
    end

    def rotate()
      args = {:playerid => @player_id}
      response = @controller.send_command('Player.Rotate', args)
      response.parsed_response
    end

    def seek()
      args = {:playerid => @player_id}
      response = @controller.send_command('Player.Seek', args)
      response.parsed_response
    end

    def set_audio_stream()
      args = {:playerid => @player_id}
      response = @controller.send_command('Player.SetAudioStream', args)
      response.parsed_response
    end

    def set_party_mode()
      args = {:playerid => @player_id}
      response = @controller.send_command('Player.SetPartymode', args)
      response.parsed_response
    end

    def set_repeat()
      args = {:playerid => @player_id}
      response = @controller.send_command('Player.SetRepeat', args)
      response.parsed_response
    end

    def set_shuffle()
      args = {:playerid => @player_id}
      response = @controller.send_command('Player.SetShuffle', args)
      response.parsed_response
    end

    def set_speed()
      args = {:playerid => @player_id}
      response = @controller.send_command('Player.SetSpeed', args)
      response.parsed_response
    end

    def set_subtitle()
      args = {:playerid => @player_id}
      response = @controller.send_command('Player.SetSubtitle', args)
      response.parsed_response
    end

    def stop()
      args = {:playerid => @player_id}
      response = @controller.send_command('Player.Stop', args)
      response.parsed_response
    end

    def zoom()
      args = {:playerid => @player_id}
      response = @controller.send_command('Player.Zoom', args)
      response.parsed_response
    end

  end
end
