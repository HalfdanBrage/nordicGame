extends AnimatableBody2D


var velocity: Vector2 = Vector2(-5, 5)

func _ready():
	Levelmanager._bullet = self

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	var collision = move_and_collide(velocity)

	if collision != null:
		velocity = get_vector_reflection(velocity, collision.get_normal())

func get_vector_reflection(vector: Vector2, normal: Vector2) -> Vector2:
	return vector - 2 * vector.dot(normal) * normal
