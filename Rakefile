
namespace :gem do
	require 'bundler/gem_tasks'
end

require 'xbmc'


# @xbmc_location = 'http://localhost:8081'
# @xbmc_location = 'http://192.168.1.76'
@xbmc_location = 'http://openelec.home'

task :default => :menu


desc 'plays a video from iPlayer'
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

	p playlist.clear()
	p playlist.add(youtube_plugin_command)
	p player.get_active_players()
	p player.stop()
	p playlist
	p player.open(playlist)
p :l
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




class XBMC::Input
	def initialize(client)
		@client = client
	end
	def left
		@client.send_command('Input.Left')
	end
	def right
		@client.send_command('Input.Right')
	end
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
