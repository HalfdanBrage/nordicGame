extends AnimatableBody2D


func _ready():
	Levelmanager._player = self

func _input(event):
	if Input.is_action_just_pressed("shoot"):
		#position = Levelmanager._bullet.position
		swap_positions(self, Levelmanager._bullet)

func swap_positions(node_1: Node2D, node_2: Node2D):
	print(": ", node_1.position, " - ", node_2.position)
	
	var tmp = Vector2(node_1.position)
	node_1.position = node_2.position
	node_2.position = tmp
	
	print(": ", node_1.position, " - ", node_2.position)
