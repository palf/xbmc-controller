xbmc_controller
===============

A command-line controller for XBMC


Usage
=====

run `rake menu` to open up a menu of available commands (gathered from JSONRPC.Introspect)
run `rake play` to toggle between play and pause
run `rake youtube` to start playing a video from YouTube (default is Ben Mono - The Feel (Bit Funk Remix))
run `rake youtube[some_video_id]` to play that video instead
