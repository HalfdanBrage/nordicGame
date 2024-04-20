extends Node

var splash_res = preload("res://music/splash.tscn")
var chill_res = preload("res://music/chill.tscn")
var out_res = preload("res://music/out.tscn")

var splash = splash_res.instantiate()
var chill = chill_res.instantiate()
var out = out_res.instantiate()

func _ready():
	add_child(splash)
	add_child(chill)
	add_child(out)

func stop():
	for child in get_children():
		child.stop()

func play_splash():
	stop()
	splash.play()

func play_chill():
	stop()
	chill.play()

func play_out():
	stop()
	out.play()
