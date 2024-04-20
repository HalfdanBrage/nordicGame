extends CharacterBody2D

class_name Bullet

var directionSpeed: Vector2 = Vector2(-5, 5)

func _ready():
	Levelmanager.add_bullet(self)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	var collision = move_and_collide(directionSpeed)

	if collision != null:
		directionSpeed = get_vector_reflection(directionSpeed, collision.get_normal())

func get_vector_reflection(vector: Vector2, normal: Vector2) -> Vector2:
	return vector - 2 * vector.dot(normal) * normal
