require 'xbmc'
require 'rspec/core/rake_task'
require 'cucumber/rake/task'


task :default => 'test:all'

@xbmc_location = ENV['XBMC_LOCATION'] || 'http://openelec.home'
@controller = XBMC::Controller.new(@xbmc_location)
@client = XBMC::Client.new(@xbmc_location)


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
		video_id = args[:video_id] || 'o0I0EMvQnv8'
		link = "plugin://plugin.video.youtube/?action=play_video&videoid=#{video_id}"
		@controller.play(link)
	end


	desc 'plays a video from iPlayer'
	task :iplayer, :pid do |task, args|
		pid = args[:pid] || 'b01s5hth' #raise('no pid provided')
		link = "plugin://plugin.video.iplayer.palf/?pid=#{pid}"
		@controller.play(link)
	end


	desc 'toggles between play and pause'
	task :play do
		@client.send_command('Player.PlayPause', {:playerid => 1} )
	end


	desc 'pings the @client'
	task :ping do
		p @client.ping()
	end


	desc 'opens up the control menu'
	task :menu do
		menu = XBMC::Menu.new(@client)
		menu.start()
	end


	desc 'presses left'
	task :left do
		input = XBMC::Input.new(@client)
		input.left()
	end


	desc 'presses right'
	task :right do
		input = XBMC::Input.new(@client)
		input.right()
	end
end
