extends Node2D

const LEVEL_NAME_RES = preload("res://Menus/level_name.tscn")

@export var level_name = "Placeholder level name"
@export var bounds_min = Vector2.ZERO
@export var bounds_max = Vector2.ZERO

func _ready():
	Musicplayer.play_chill()
	if Levelmanager.show_level_title:
		show_name()
		Levelmanager.show_level_title = false

func show_name():
	var ln = LEVEL_NAME_RES.instantiate()
	ln.text = level_name
	add_child(ln)
	ln.display()

func _input(event):
	if event.is_action_pressed("pause"):
		Levelmanager.pause()

