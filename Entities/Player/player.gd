extends CharacterBody2D

class_name Player

@export var is_level_1 = false

const BULLET_RES = preload("res://Entities/Bullet/bullet.tscn")
const BULLET_SPAWN_OFFSET = Vector2(50, 0)

@export var bullet: Bullet = null

var bulletPos = null

var can_swap = true
var can_shoot = true

var angle

@export var involnurable = false

func _ready():
	$AnimatedSprite2D.visible = true
	$AnimatedSprite2D2.visible = false
	$AimLine.visible = true
	make_volnurable()
	Levelmanager.set_player(self)
	
func _physics_process(delta):
	set_ray_cast()
	angle = get_aim_angle().angle()
	$AnimatedSprite2D.rotation = angle - PI * 0.5
	$AimLine.set_point_position(0, BULLET_SPAWN_OFFSET.rotated(angle))
	set_active_bullet_line()

func _input(event):
	if Input.is_action_just_pressed("swap"):
		if bullet != null:
			$AnimationPlayer.play("teleport")
			bullet.get_node("AnimationPlayer").play("teleport")
		
	if Input.is_action_just_pressed("shoot"):
		shoot()

func get_aim_angle():
	if Levelmanager.is_controller:
		return Vector2(
			Input.get_action_strength("aim right") - Input.get_action_strength("aim left"),
			Input.get_action_strength("aim down") - Input.get_action_strength("aim up")
		).normalized()
	else:
		return global_position.direction_to(get_global_mouse_position())

func make_involnurable():
	involnurable = true

func make_volnurable():
	if not Levelmanager.level_finished:
		involnurable = false

func swap():
	if not can_swap:
		return
	#can_swap = false
	#$"Swap cooldown".start()
	
	if bullet != null:
		bulletPos = bullet.global_position 
		swap_positions(self, bullet)
		bullet.set_just_swapped()
		if not is_level_1:
			disable_bullet()

func swap_positions(node_1: Node2D, node_2: Node2D):
	var tmp = Vector2(node_1.global_position)
	node_1.global_position = node_2.global_position
	node_2.global_position = tmp

func shoot():
	if is_level_1 or not can_shoot:
		return
	
	$AnimatedSprite2D.animation = "shoot"
	$Shoot.play()
	can_swap = false
	can_shoot = false
	$"Swap cooldown".start()
	
	var aim_dir = get_aim_angle()
	if aim_dir:
		disable_bullet()
		var new_bullet = BULLET_RES.instantiate()
		new_bullet.dir = aim_dir
		new_bullet.position = position + BULLET_SPAWN_OFFSET.rotated(angle)
		bullet = new_bullet
		get_parent().add_child(new_bullet)
		new_bullet.activate()

func disable_bullet():
	if not bullet == null:
		bullet.deactivate()
		bullet = null

func damage():
	if not involnurable:
		$AnimationPlayer.play("die")

func respawn():
	Levelmanager.respawn()
	
func set_ray_cast():
	var rayNode: RayCast2D = get_node("RayCast2D")
	var target_position = (1000 * get_aim_angle())
	rayNode.target_position = target_position
	
	var line: Line2D = get_node("AimLine")
	var col_point = rayNode.get_collision_point()
	if rayNode.is_colliding():
		target_position = (get_aim_angle() * global_position.distance_to(col_point))
	line.set_point_position(1, target_position)
	#print("Player:", position, " player global: ", global_position)
	#print("line start:" , line.get_point_position(0), " line end: ", line.get_point_position(1))

func set_active_bullet_line():
	var line = get_node("ActiveBulletLine")
	if bullet != null:
		line.show()
		line.set_point_position(1, bullet.position - global_position)
	else:
		line.hide()

func _on_shoot_cooldown_timeout():
	can_swap = true
	can_shoot = true
	if $AnimatedSprite2D.animation == "shoot":
		$AnimatedSprite2D.animation = "default"
