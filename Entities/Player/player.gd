extends CharacterBody2D

class_name Player

const BULLET_PATH = "res://Entities/Bullet/bullet.tscn"
var bullet = preload(BULLET_PATH)


var is_controller = false

func _ready():
	Levelmanager.set_player(self)
	Levelmanager.add_exception_body(self)

func _physics_process(delta):
	pass	

func _input(event):
	if Input.is_action_just_pressed("swap"):
		swap_positions(self, Levelmanager.get_newest_bullet())
		
	if Input.is_action_just_pressed("shoot"):
		shoot()
	
	if event is InputEventJoypadButton:
		is_controller = true
	else:
		is_controller = false

func get_aim_angle():
	if is_controller:
		return Vector2(
			Input.get_action_strength("aim right") - Input.get_action_strength("aim left"),
			Input.get_action_strength("aim down") - Input.get_action_strength("aim up")
		).normalized()
	else:
		return global_position.direction_to(get_global_mouse_position())

func swap_positions(node_1: Node2D, node_2: Node2D):
	var tmp = Vector2(node_1.position)
	node_1.position = node_2.position
	node_2.position = tmp

func shoot():
	var new_bullet = bullet.instantiate()
	new_bullet.dir = get_aim_angle()
	new_bullet.position = position
	get_parent().add_child(new_bullet)

func damage():
	print("OWWW")
