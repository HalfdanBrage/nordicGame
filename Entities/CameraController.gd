extends Camera2D

@export var lerp_speed: float = 1
@export var zoom_lerp_speed: float = 1

@export var max_breathing_y_offset: float = 10
@export var breathing_speed: float = 8

@export var max_mouse_offset_magnitude: float = 10

var breating_offset: Vector2 = Vector2.ZERO
var breathing_down = true

func _process(delta):
	set_breathing(delta)
	
	var player = Levelmanager.get_player()
	
	if player == null:
		return
	
	var target_position = player.position
	var zoom_target = Vector2.ONE
	
	var mouse_offset = get_mouse_offset(player.position)
	
	var bullet = player.bullet
	if bullet != null:
		var player_to_bullet = bullet.position - player.position
		target_position = player.position + player_to_bullet / 2
		
		zoom_target = get_zoom_target(player_to_bullet)
	
	var final_target_position = target_position + breating_offset + mouse_offset
	position = position.lerp(final_target_position, delta * lerp_speed)
	
	zoom = zoom.lerp(zoom_target, delta * zoom_lerp_speed)

func get_zoom_target(player_to_bullet: Vector2) -> Vector2:
	player_to_bullet = Vector2(abs(player_to_bullet.x), abs(player_to_bullet.y))
	
	var viewport_size = Vector2(640, 320)
	
	var zoom_target_x = viewport_size.x / max(1, player_to_bullet.x)
	var zoom_target_y = viewport_size.y / max(1, player_to_bullet.y)
	var zoom_target_val = min(1, minf(zoom_target_x, zoom_target_y) * 0.6)

	return Vector2(zoom_target_val, zoom_target_val)

func get_mouse_offset(target_position: Vector2):
	var target_to_mouse = get_global_mouse_position() - target_position
	if target_to_mouse.length() < max_mouse_offset_magnitude:
		return target_to_mouse
	return target_to_mouse.normalized() * max_mouse_offset_magnitude

func set_breathing(delta):
	if breathing_down:
		breating_offset.y += delta * breathing_speed
	else :
		breating_offset.y -= delta * breathing_speed
	
	if max_breathing_y_offset < abs(breating_offset.y):
		breathing_down = !breathing_down
