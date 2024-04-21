extends Node

const WIN_SCREEN_RES = preload("res://Menus/win_screen.tscn")
const PAUSE_SCREEN_RES = preload("res://Menus/pause_screen.tscn")

var is_controller = false
var pause_screen = null
var level_finished = false
var show_level_title = false
var _player: Player = null
var currentLevelIndex = 0
var levels: Array = [
	"res://Levels/Main_levels/level_1.tscn", # 0 Swap swap
	"res://Levels/Main_levels/Empty_maze_v2.tscn", # 1 Cargo
	"res://Levels/Main_levels/level_2.tscn", # 2 Minigolf
	"res://Levels/Main_levels/after_level_1.tscn", # 3 ...
	"res://Levels/Main_levels/clustered_area.tscn", # 4 Apocalypse
	"res://Levels/Main_levels/level_3.tscn", # 5 Chinese intelligence
	"res://Levels/Main_levels/All_over_the_place.tscn", # 6
	"res://Levels/Main_levels/far_away.tscn", # 7
	"res://Levels/Main_levels/the_wall.tscn", # 8
	"res://Levels/Main_levels/cling_on.tscn", # 9
	"res://Levels/Main_levels/Forrest.tscn", # 10
	"res://Levels/Main_levels/where.tscn", # 11
	"res://Levels/Main_levels/level_4.tscn",# 12
]

var splashes = {
	5: "Apocalypse.png",
	3: "AroundTheCorner.png",
	9: "ClingingOn.png",
	10: "Forest.png",
	2: "minigolf.png",
	6: "TheMess.png",
	11: "TheStation.png",
	8: "TheWall.png",
	0: "tutorial.png",
}

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
	currentLevelIndex = index
	get_tree().change_scene_to_file(levels[index])

func has_next_level() -> bool:
	return currentLevelIndex + 1 < levels.size() - 1
	
func has_prev_level() -> bool:
	return currentLevelIndex - 1 > 0

func play_next_level():
	if has_next_level():
		select_level(currentLevelIndex + 1)
		
func play_prev_level():
	if has_prev_level():
		select_level(currentLevelIndex - 1)

func respawn():
	if get_tree() != null:
		get_tree().reload_current_scene()

func pause():
	if not get_tree().paused:
		get_tree().paused = true
		pause_screen = PAUSE_SCREEN_RES.instantiate()
		add_child(pause_screen)

func _pause():
	if not get_tree().paused:
		get_tree().paused = true

func unpause():
	if get_tree().paused:
		get_tree().paused = false
		pause_screen.queue_free()

func _unpause():
	if get_tree().paused:
		get_tree().paused = false
