extends Camera2D

#@export var lerp_speed: float = 1
@export var fast_lerp_speed: float = 1
@export var slow_lerp_speed: float = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var target = Levelmanager.get_newest_bullet()
	var lerp_speed = slow_lerp_speed
	
	var player = Levelmanager.get_player()
	if player != null:
		target = Levelmanager.get_player()
		lerp_speed = fast_lerp_speed
	
	position = position.lerp(target.position, delta * lerp_speed)
