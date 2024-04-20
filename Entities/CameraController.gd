extends Camera2D

@export var lerp_speed: float = 1

@export var max_breathing_y_offset: float = 10
@export var breathing_speed: float = 8

@export var max_mouse_offset_magnitude: float = 10

var breating_offset: Vector2 = Vector2.ZERO
var breathing_down = true

func _process(delta):
	set_breathing(delta)
	
	var player = Levelmanager.get_player()
	if player != null:
		var target = Levelmanager.get_player()
		var mouse_offset = get_mouse_offset(target.position)
		
		var final_target_position = target.position + breating_offset + mouse_offset
		position = position.lerp(final_target_position, delta * lerp_speed)

func get_mouse_offset(target_position: Vector2):
	var target_to_mouse = get_global_mouse_position() - target_position
	var mouse_offset = target_to_mouse
	if target_to_mouse.length() < max_mouse_offset_magnitude:
		return target_to_mouse
	return target_to_mouse.normalized() * max_mouse_offset_magnitude
		
		
	if max_mouse_offset_magnitude < mouse_offset.length():
		mouse_offset = target_to_mouse.normalized() * max_mouse_offset_magnitude
	return mouse_offset

func set_breathing(delta):
	if breathing_down:
		breating_offset.y += delta * breathing_speed
	else :
		breating_offset.y -= delta * breathing_speed
	
	if max_breathing_y_offset < abs(breating_offset.y):
		breathing_down = !breathing_down
