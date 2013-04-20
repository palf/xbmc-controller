require 'xbmc'


namespace :gem do
	require 'bundler/gem_tasks'
end


@xbmc_location = ENV['XBMC_LOCATION'] || 'http://openelec.home'

task :default => :youtube


task :iplayer, :pid do |task, args|
	raise 'only works when the iplayer content is valid (1 week)'
	pid = args[:pid] || 'p013mrl8'
	iplayer_plugin_command = "plugin://plugin.video.iplayer.palf/?pid=#{pid}"
	puts "playing video with pid: #{pid}"

	client = XBMC::Client.new(@xbmc_location)
	playlist = XBMC::Playlist.new(client)
	player = XBMC::Player.new(client)

	playlist.clear()
	playlist.add(iplayer_plugin_command)
	player.get_active_players()
	player.stop()
	player.open(playlist)
end



desc 'plays a video from YouTube'
task :youtube, :video_id do |task, args|
	video_id = args[:video_id] || 'K26dgShCL60'
	youtube_plugin_command = "plugin://plugin.video.youtube/?action=play_video&videoid=#{video_id}"
	puts "playing video with id: #{video_id}"

	client = XBMC::Client.new(@xbmc_location)
	playlist = XBMC::Playlist.new(client)
	player = XBMC::Player.new(client)

	playlist.clear()
	playlist.add(youtube_plugin_command)
	player.open(playlist)
end




desc 'toggles between play and pause'
task :play do
	client = XBMC::Client.new(@xbmc_location)
	client.send_command('Player.PlayPause', {:playerid => 1} )
end


desc 'opens up the control menu'
task :menu do
	client = XBMC::Client.new(@xbmc_location)
	menu = XBMC::Menu.new(client)
	menu.start()
end



desc 'presses left'
task :left do
	client = XBMC::Client.new(@xbmc_location)
	input = XBMC::Input.new(client)
	input.left()
end


desc 'presses right'
task :right do
	client = XBMC::Client.new(@xbmc_location)
	input = XBMC::Input.new(client)
	input.right()
end
