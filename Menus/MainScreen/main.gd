extends MarginContainer

func _ready():
	Musicplayer.play_splash()
	$Control/VBoxContainer/Focus.grab_focus()

func _on_play_pressed():
	Musicplayer.play_chill()
	Levelmanager.select_level(0)


func _on_level_select_pressed():
	get_tree().change_scene_to_file("res://Menus/SelectLevel/select_level.tscn")


func _on_quit_pressed():
	get_tree().quit()
