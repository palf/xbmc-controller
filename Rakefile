require './lib/xbmc'


task :default => :menu


desc 'plays a video from YouTube'
task :youtube do
	controller = XBMC::Controller.new('http://localhost:8081')
	controller.run('Playlist.GetItems', {:playlistid => 1})
	controller.run('Playlist.Add', {:playlistid => 1, :item => {:file => "plugin://plugin.video.youtube/?action=play_video&videoid=K26dgShCL60"}})
	controller.run('Player.GetActivePlayers')
	controller.run('Player.Open', {:item => {:playlistid => 1, :position => 0}})
end


desc 'toggles between play and pause'
task :play do
	system 'ruby ./scripts/play_pause.rb'
end


desc 'opens up the control menu'
task :menu do
	system 'ruby ./scripts/menu.rb'
end
