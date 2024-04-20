extends TextureButton

var level_number: int = 0


func set_level(level: int):
	level_number = level
	var n1 = floor(level_number / 10)
	var n2 = level_number % 10
	$Texture_2_1.texture = load("res://Assets/UI/" + str(n1)+".png")
	$Texture_2_2.texture = load("res://Assets/UI/" + str(n2)+".png")



func _on_pressed():
	Levelmanager.select_level(level_number)
