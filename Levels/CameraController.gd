extends Camera2D

@export var lerp_speed: float = 1
#@export var fast_lerp_speed: float = 1
#@export var slow_lerp_speed: float = 1

func _process(delta):
	var player = Levelmanager.get_player()
	if player != null:
		var target = Levelmanager.get_player()
		#var lerp_speed = fast_lerp_speed
		position = position.lerp(target.position, delta * lerp_speed)
