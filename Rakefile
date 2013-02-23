require './lib/xbmc'


task :default => :menu


desc 'plays a video from YouTube'
task :youtube, :video_id do |task, args|
	video_id = args[:video_id] || 'K26dgShCL60'
	youtube_plugin_command = "plugin://plugin.video.youtube/?action=play_video&videoid=#{video_id}"
	puts "playing video with id: #{video_id}"
	
	controller = XBMC::Controller.new('http://localhost:8081')
	controller.send_command('Playlist.Clear', {:playlistid => 1})
	controller.send_command('Playlist.Add', {:playlistid => 1, :item => {:file => youtube_plugin_command}})
	controller.send_command('Player.GetActivePlayers')
	controller.send_command('Player.Open', {:item => {:playlistid => 1, :position => 0}})
end


desc 'toggles between play and pause'
task :play do
	controller = XBMC::Controller.new('http://localhost:8081')
	controller.send_command('Player.PlayPause', {:playerid => 1} )
end


desc 'opens up the control menu'
task :menu do
	controller = XBMC::Controller.new('http://localhost:8081')
	menu = XBMC::Menu.new(controller)
	menu.run
end
