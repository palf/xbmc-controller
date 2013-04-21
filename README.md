# XBMC Controller

A Ruby controller for XBMC. Comes with some Rake tasks for common use cases, like launching a YouTube video.


## Prerequisites

- [XBMC](http://xbmc.org)
- Ruby
- Bundler

You need [XBMC](http://xbmc.org) installed and running somewhere accessible, either on your machine or local network.

I'd recommend installing RVM and installing Ruby through that. Instructions can be found on the RVM homepage.

Once you have installed Ruby and checked out the code, install the dependencies by running:

    gem install bundler
    bundle install


## Usage
You will need to turn on control over HTTP in your XBMC settings (which you need for most remotes to work).

The script is expecting an environment variable to specify where your XBMC location is.

    export XBMC_LOCATION=http://your.xbmc.ip:80

It defaults to 'http://openelec.home:80', which is the default location for an OpenElec instance.

_Play / Pause toggle_

    rake play

_Play a Youtube video_

    rake youtube             # to start playing Ben Mono - The Feel (Bit Funk Remix)
    rake youtube[video_id]   # play the video specified by the video_id property

    The video id can be found in the address bar, and is the value of the 'v' parameter
    For example, the video id in 'http://www.youtube.com/watch?v=K26dgShCL60' is 'K26dgShCL60'
    Copy the full url into your browser to play some more Ben Mono
