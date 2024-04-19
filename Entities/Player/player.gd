extends Node2D


func _ready():
	Levelmanager._player = self

func _input(event):
	if Input.is_action_just_pressed("shoot"):
		print("Space pressed")
		position = Levelmanager._bullet.position
		print("Player pos: " + str(Levelmanager._player.position.x) + ", " + str(Levelmanager._player.position.y))
		print("Enemy pos: " + str(Levelmanager._bullet.position.x) + ", " + str(Levelmanager._bullet.position.y))
