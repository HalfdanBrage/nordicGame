extends Node2D



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _notification(what):
	match what:
		NOTIFICATION_PREDELETE:
			if Levelmanager != null:
				Levelmanager.respawn()
