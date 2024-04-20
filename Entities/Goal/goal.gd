extends Node2D


func _on_player_collision_area_body_entered(body):
	if body.name == "Player":
		Levelmanager.level_finished = true
		body.make_involnurable()
		Levelmanager.show_win_screen()
