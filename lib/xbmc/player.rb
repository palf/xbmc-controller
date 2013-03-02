
module XBMC
  class Player
    def initialize(controller)
      @controller = controller
      @player_id = 1
    end

    def get_active_players()
      @controller.send_command('Player.GetActivePlayers')
    end

    def stop()
      @controller.send_command('Player.Stop', {:playerid => @player_id})
    end

    def open(playlist)
      @controller.send_command('Player.Open', {:item => {:playlistid => playlist.playlist_id, :position => 0}})
    end
  end
end

