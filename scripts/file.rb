require './lib/xbmc/control'

include XBMC::Control


def run(method, params = {})
  r = send_command(method, params)
  r.parsed_response
end


#p run('Playlist.Clear', {:playlistid => 1} )
p run('Playlist.GetItems', {:playlistid => 1} )
p run('Playlist.Add', {:playlistid => 1, :item => { :file => "http://g.bbcredux.com/programme/5135437420522924334/download/16162-1361483295-f679014b3d92bfa85684896fd64e25d1/20071121_232000_bbctwo_man_stroke_woman-lo.mp4" }} )

p run('Player.GetActivePlayers')
p run('Player.Open', {:item => {:playlistid => 1, :position => 0}} )





#{"jsonrpc": "2.0", "method": "Playlist.Add", "params":{"playlistid":1, "item" :{ "file" : "plugin://plugin.video.youtube/?action=play_video&videoid=K26dgShCL60" }}, "id" : 1}


