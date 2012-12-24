require 'rubygems'
require 'httparty'
require 'json'

require './control/xbmc'

include XBMC


data = xbmc_get()
p data['methods'].keys


p send_command('Player.PlayPause', {:playerid => 1} )
