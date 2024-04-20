extends Camera2D

@export var lerp_speed: float = 1

@export var max_breathing_y_offset: float = 10
@export var breathing_speed: float = 8

var breating_offset: Vector2 = Vector2.ZERO
var breathing_down = true

func _process(delta):
	set_breathing(delta)
	
	var player = Levelmanager.get_player()
	if player != null:
		var target = Levelmanager.get_player()
		var target_position = target.position + breating_offset
		position = position.lerp(target_position, delta * lerp_speed)

func set_breathing(delta):
	if breathing_down:
		breating_offset.y += delta * breathing_speed
	else :
		breating_offset.y -= delta * breathing_speed
	
	if max_breathing_y_offset < abs(breating_offset.y):
		breathing_down = !breathing_down
