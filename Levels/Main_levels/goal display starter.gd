extends Node2D


func _input(event):
	if event.is_action_pressed("swap"):
		print("YES")
		get_parent().display()
