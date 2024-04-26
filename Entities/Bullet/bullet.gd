extends CharacterBody2D

class_name Bullet

const SPEED = 5

var dir: Vector2 = Vector2.DOWN

func _ready():
	$Sprite2D.visible = true

var frames_since_swap = 0
func set_just_swapped():
	frames_since_swap = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var current_level = get_tree().current_scene
	if global_position.x < current_level.bounds_min.x or global_position.x > current_level.bounds_max.x or global_position.y < current_level.bounds_min.y or global_position.y > current_level.bounds_max.y:
		queue_free()
	
	frames_since_swap += 1
	
	velocity = SPEED * dir
	
	var collision = move_and_collide(velocity)
	
	if collision != null:
		dir = get_vector_reflection(velocity, collision.get_normal()).normalized()

func deactivate():
	pass
	
func activate():
	pass

func get_vector_reflection(vector: Vector2, normal: Vector2) -> Vector2:
	return vector - 2 * vector.dot(normal) * normal

func _on_area_2d_body_entered(body):
	if body.has_method("damage") and frames_since_swap > 1:
		body.damage()
		$AnimationPlayer.play("kill_player")


func _on_collisionsparkarea_body_entered(body):
	play_hit_effects(body)


func _on_collisionsparkarea_area_entered(area):
	play_hit_effects(area)

func play_hit_effects(target : Node2D):
	$GPUParticles2D2.restart()
	$Bounce.play()
	
	if target.is_in_group("metal"):
		$Metal.play()
	
