extends Node

var _player: Player = null
var currentLevelIndex = 0
var levels: Array = [
	"res://Levels/test-level-1.tscn",
	"res://Levels/01_intro/level.tscn",
]

func set_player(player: Player):
	_player = player
func get_player() -> Player:
	return _player

func show_win_screen():
	pass
	
func select_level(index: int):
	if (index > levels.size() - 1 || index < 0):
		print("Out of bounds level")
		return;
	
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
