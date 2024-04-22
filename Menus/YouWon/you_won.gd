extends Control

func _ready():
	Musicplayer.play_splash()

func _on_texture_button_pressed():
	get_tree().change_scene_to_file("res://Menus/Credits/credits.tscn")
