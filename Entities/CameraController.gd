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
		var target_to_mouse = get_global_mouse_position() - target.position
		var mouse_offset = target_to_mouse
		if max_mouse_offset_magnitude < mouse_offset.length():
			print("out")
			mouse_offset = target_to_mouse.normalized() * max_mouse_offset_magnitude
		print(target_to_mouse, mouse_offset)
		
		var target_position = target.position + breating_offset + mouse_offset
		position = position.lerp(target_position, delta * lerp_speed)

func set_breathing(delta):
	if breathing_down:
		breating_offset.y += delta * breathing_speed
	else :
		breating_offset.y -= delta * breathing_speed
	
	if max_breathing_y_offset < abs(breating_offset.y):
		breathing_down = !breathing_down
