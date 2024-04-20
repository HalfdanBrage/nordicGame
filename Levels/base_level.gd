extends Node2D

const LEVEL_NAME_RES = preload("res://Menus/level_name.tscn")

@export var level_name = "Placeholder level name"

func _ready():
	Musicplayer.play_chill()
	if Levelmanager.show_level_title:
		show_name()
		Levelmanager.show_level_title = false

func show_name():
	var ln = LEVEL_NAME_RES.instantiate()
	ln.text = level_name
	get_tree().get_root().add_child(ln)
	ln.display()
