extends Node

const WIN_SCREEN_RES = preload("res://Menus/win_screen.tscn")

var level_finished = false
var show_level_title = false
var _player: Player = null
var currentLevelIndex = 0
var levels: Array = [
	"res://Levels/Main_levels/level_1.tscn",
	"res://Levels/Main_levels/level_2.tscn",
	"res://Levels/Main_levels/level_3.tscn",
	"res://Levels/Main_levels/after_level_1.tscn",
]

func set_player(player: Player):
	_player = player
func get_player() -> Player:
	return _player

func show_win_screen():
	get_tree().current_scene.add_child(WIN_SCREEN_RES.instantiate())
	
func select_level(index: int):
	if (index > levels.size() - 1 || index < 0):
		print("Out of bounds level")
		return;
	
	show_level_title = true
	level_finished = false
	get_tree().change_scene_to_file(levels[index])

func has_next_level() -> bool:
	return currentLevelIndex + 1 < levels.size() - 1
	
func has_prev_level() -> bool:
	return currentLevelIndex - 1 > 0

func play_next_level():
	if has_next_level():
		select_level(currentLevelIndex + 1)
		currentLevelIndex += 1
		
func play_prev_level():
	if has_prev_level():
		select_level(currentLevelIndex - 1)
		currentLevelIndex -= 1

func respawn():
	get_tree().reload_current_scene()
