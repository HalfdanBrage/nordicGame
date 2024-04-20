extends CharacterBody2D

class_name Player

const BULLET_RES = preload("res://Entities/Bullet/bullet.tscn")

var bullet: Bullet = null

var is_controller = false

var can_swap = true

func _ready():
	Levelmanager.set_player(self)

func _physics_process(delta):
	pass

func _input(event):
	if Input.is_action_just_pressed("swap"):
		swap()
		
	if Input.is_action_just_pressed("shoot"):
		shoot()
	# TODO: refine joypad aiming later
	if event is InputEventJoypadButton:
		is_controller = true
	elif event is InputEventMouse:
		is_controller = false

func get_aim_angle():
	if is_controller:
		return Vector2(
			Input.get_action_strength("aim right") - Input.get_action_strength("aim left"),
			Input.get_action_strength("aim down") - Input.get_action_strength("aim up")
		).normalized()
	else:
		return global_position.direction_to(get_global_mouse_position())

func swap():
	if not can_swap:
		return
	#can_swap = false
	#$"Swap cooldown".start()
	
	if bullet != null:
		swap_positions(self, bullet)
		bullet.set_just_swapped()
		#disable_bullet()

func swap_positions(node_1: Node2D, node_2: Node2D):
	print("start")
	var tmp = Vector2(node_1.global_position)
	node_1.global_position = node_2.global_position
	node_2.global_position = tmp
	print("stop")

func shoot():
	can_swap = false
	$"Swap cooldown".start()
	
	var aim_dir = get_aim_angle()
	if aim_dir:
		disable_bullet()
		var new_bullet = BULLET_RES.instantiate()
		new_bullet.dir = aim_dir
		new_bullet.position = position
		bullet = new_bullet
		get_parent().add_child(new_bullet)
		new_bullet.activate()

func disable_bullet():
	if not bullet == null:
		bullet.deactivate()
		bullet = null

func damage():
	Levelmanager.respawn()
	print("OWWW")


func _on_shoot_cooldown_timeout():
	can_swap = true
