extends Control


var LEVEL_BORDER = preload("res://Menus/SelectLevel/level_border.tscn")



func _ready():
	for n in range(Levelmanager.levels.size()):
		var k1: TextureButton = LEVEL_BORDER.instantiate()
		k1.set_level(n+1, n)
		if Levelmanager.splashes.has(n):
			k1.set_splash("res://Assets/Screenshots/"+Levelmanager.splashes.get(n))
		$LevelGrid.add_child(k1)
	$LevelGrid.get_child(1).grab_focus()
	


func _on_texture_button_pressed():
	get_tree().change_scene_to_file("res://Menus/MainScreen/main.tscn")
