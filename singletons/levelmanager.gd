extends Node


var _bullet: CharacterBody2D
var _player: CharacterBody2D

# Keep track of if the body just swapped
var just_swapped = false

func add_exception_body(node: Node2D):
	if _bullet != null:
		_bullet.add_collision_exception_with(node)

