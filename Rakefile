require 'xbmc'
require 'rspec/core/rake_task'
require 'cucumber/rake/task'


task :default => 'test:spec'
@xbmc_location = ENV['XBMC_LOCATION'] || 'http://openelec.home'


namespace :gem do
	require 'bundler/gem_tasks'
end


namespace :test do
	RSpec::Core::RakeTask.new { |task|
		task.rspec_opts = ['--color', '--format', 'documentation']
	}

	Cucumber::Rake::Task.new(:features, 'run Cucumber and store a junit report') do |task|
		task.fork = false
		task.cucumber_opts = [
				'--format', 'junit',
				'--out', 'reports/junit',
				'--format', 'pretty',
				'--strict'
		]
	end

	task :all => ['test:spec', 'test:features']
end


namespace :xbmc do
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


	desc 'pings the client'
	task :ping do
		client = XBMC::Client.new(@xbmc_location)
		p client.ping()
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
		client = XBMC::Client.new(@XBMC_LOCATION)
		input = XBMC::Input.new(client)
		input.right()
	end
end
