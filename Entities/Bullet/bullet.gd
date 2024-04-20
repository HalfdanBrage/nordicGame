extends CharacterBody2D

class_name Bullet

const SPEED = 5

var dir: Vector2 = Vector2.RIGHT

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity = SPEED * dir
	
	var collision = move_and_collide(velocity)
	
	if collision != null:
		dir = get_vector_reflection(velocity, collision.get_normal()).normalized()

func deactivate():
	$AnimatedSprite2D.play("inactive")
	
func activate():
	$AnimatedSprite2D.play("active")

func get_vector_reflection(vector: Vector2, normal: Vector2) -> Vector2:
	return vector - 2 * vector.dot(normal) * normal

func _on_area_2d_body_entered(body):
	if body.has_method("damage"):
		body.damage()
	Area2D


func _on_timer_timeout():
	$Area2D.monitoring = true


func _on_collisionsparkarea_body_entered(body):
	$GPUParticles2D2.restart()


func _on_collisionsparkarea_area_entered(area):
	$GPUParticles2D2.restart()
