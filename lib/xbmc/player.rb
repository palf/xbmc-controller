module XBMC
  class Player
    def initialize(client)
      @client = client
      @player_id = 1
    end

    def get_active_players()
      @client.send_command('Player.GetActivePlayers')
    end

    def get_item()
      args = {:playerid => @player_id}
      @client.send_command('Player.GetItem', args)
    end

    def get_properties()
      args = {:playerid => @player_id}
      @client.send_command('Player.GetProperties', args)
    end

    def go_to()
      args = {:playerid => @player_id}
      @client.send_command('Player.GoTo', args)
    end

    def move()
      args = {:playerid => @player_id}
      @client.send_command('Player.Move', args)
    end

    def open(item)
      args = {:item => {:playlistid => 1}}
      @client.send_command('Player.Open', args)
    end

    def play_pause()
      args = {:playerid => @player_id}
      @client.send_command('Player.PlayPause', args)
    end

    def rotate()
      args = {:playerid => @player_id}
      @client.send_command('Player.Rotate', args)
    end

    def seek()
      args = {:playerid => @player_id}
      @client.send_command('Player.Seek', args)
    end

    def set_audio_stream()
      args = {:playerid => @player_id}
      @client.send_command('Player.SetAudioStream', args)
    end

    def set_party_mode()
      args = {:playerid => @player_id}
      @client.send_command('Player.SetPartymode', args)
    end

    def set_repeat()
      args = {:playerid => @player_id}
      @client.send_command('Player.SetRepeat', args)
    end

    def set_shuffle()
      args = {:playerid => @player_id}
      @client.send_command('Player.SetShuffle', args)
    end

    def set_speed()
      args = {:playerid => @player_id}
      @client.send_command('Player.SetSpeed', args)
    end

    def set_subtitle()
      args = {:playerid => @player_id}
      @client.send_command('Player.SetSubtitle', args)
    end

    def stop()
      args = {:playerid => @player_id}
      @client.send_command('Player.Stop', args)
    end

    def zoom()
      args = {:playerid => @player_id}
      @client.send_command('Player.Zoom', args)
    end

  end
end
