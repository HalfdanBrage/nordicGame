extends Control


var LEVEL_BORDER = preload("res://Menus/SelectLevel/level_border.tscn")



func _ready():
	print(Levelmanager.levels.size())
	for n in range(Levelmanager.levels.size()):
		var k1: TextureButton = LEVEL_BORDER.instantiate()
		k1.set_level(n+1)
		$LevelGrid.add_child(k1)
