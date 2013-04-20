# XBMC Controller

A Ruby controller for XBMC.


## Usage
The script is expecting an environment variable to specify where your XBMC location is.
    export XBMC_LOCATION=http://your.xbmc.ip:80

run `rake play` to toggle between play and pause
run `rake youtube` to start playing a video from YouTube (default is Ben Mono - The Feel (Bit Funk Remix))
run `rake youtube[some_video_id]` to play that video instead
