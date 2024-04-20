extends MarginContainer




func _on_play_pressed():
	Levelmanager.select_level(0)
	

func _on_select_level_pressed():
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()
