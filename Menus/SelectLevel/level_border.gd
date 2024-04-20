extends TextureButton

var level_label: int = 0
var level_number: int = 0



func set_level(label: int, num: int):
	level_number = num
	level_label = label
	var n1 = floor(level_label / 10)
	var n2 = level_label % 10
	$Texture_2_1.texture = load("res://Assets/UI/" + str(n1)+".png")
	$Texture_2_2.texture = load("res://Assets/UI/" + str(n2)+".png")



func _on_pressed():
	Levelmanager.select_level(level_number)
