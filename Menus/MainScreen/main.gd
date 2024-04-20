extends MarginContainer

func _ready():
	Musicplayer.play_splash()

func _on_play_pressed():
	Musicplayer.play_chill()
	Levelmanager.select_level(0)
	
