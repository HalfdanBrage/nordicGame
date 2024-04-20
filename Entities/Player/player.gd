extends CharacterBody2D

class_name Player

func _ready():
	Levelmanager.set_player(self)
	Levelmanager.add_exception_body(self)

func _input(event):
	if Input.is_action_just_pressed("swap"):
		swap_positions(self, Levelmanager.get_newest_bullet())
		Levelmanager.just_swapped = true
		
	if Input.is_action_just_pressed("shoot"):
		Levelmanager.get_newest_bullet().position = position
		Levelmanager.just_swapped = true

func swap_positions(node_1: Node2D, node_2: Node2D):
	var tmp = Vector2(node_1.position)
	node_1.position = node_2.position
	node_2.position = tmp


func _on_bullet_enter_body_entered(body):
	if body.name == "Bullet" && Levelmanager.just_swapped == false:
		Levelmanager.kill_player()

func _on_bullet_enter_body_exited(body):
	if body.name == "Bullet":
		Levelmanager.just_swapped = false
