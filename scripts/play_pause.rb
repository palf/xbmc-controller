require './lib/xbmc/control'

xbmc = XBMC::Controller.new()
xbmc.send_command('Player.PlayPause', {:playerid => 1} )

