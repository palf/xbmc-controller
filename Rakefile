require './lib/xbmc/controller'

include XBMC::Control


def run(method, params = {})
	r = send_command(method, params)
	r.parsed_response
end


task :default => :menu


desc 'plays a video from YouTube'
task :youtube do
	p run('Playlist.GetItems', {:playlistid => 1})
	p run('Playlist.Add', {:playlistid => 1, :item => {:file => "plugin://plugin.video.youtube/?action=play_video&videoid=K26dgShCL60"}})
	p run('Player.GetActivePlayers')
	p run('Player.Open', {:item => {:playlistid => 1, :position => 0}})
end


desc 'toggles between play and pause'
task :play do
	system 'ruby ./scripts/play_pause.rb'
end


desc 'opens up the control menu'
task :menu do

	system 'ruby ./scripts/menu.rb'
end
