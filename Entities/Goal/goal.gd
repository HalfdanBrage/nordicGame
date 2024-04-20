extends Node2D


func _on_player_collision_area_body_entered(body):
	if body.name == "Player":
		Levelmanager.show_win_screen()
