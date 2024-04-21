extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	print(Levelmanager.is_controller)
	if Levelmanager.is_controller:
		$CenterContainer/VBoxContainer/HBoxContainer/TextureButton.button_pressed = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_texture_button_focus_entered():
	$CenterContainer/VBoxContainer/HBoxContainer/TextureButton.scale = Vector2(1.2, 1.2)


func _on_texture_button_focus_exited():
		$CenterContainer/VBoxContainer/HBoxContainer/TextureButton.scale = Vector2(1.0, 1.0)


func _on_texture_button_mouse_entered():
	$CenterContainer/VBoxContainer/HBoxContainer/TextureButton.scale = Vector2(1.2, 1.2)


func _on_texture_button_mouse_exited():
	$CenterContainer/VBoxContainer/HBoxContainer/TextureButton.scale = Vector2(1.0, 1.0)


func _input(event):
	if event.is_action_pressed("pause"):
		Levelmanager.unpause()


func _on_texture_button_pressed():
	Levelmanager.is_controller = not Levelmanager.is_controller


func _on_resume_button_pressed():
	Levelmanager.unpause()


func _on_texture_mainmenu_2_pressed():
	Levelmanager.unpause()
	get_tree().change_scene_to_file("res://Menus/MainScreen/main.tscn")
