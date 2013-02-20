require './lib/xbmc/control'

include XBMC::Control


send_command('Player.PlayPause', {:playerid => 1} )

 