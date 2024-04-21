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
	"res://Levels/Main_levels/level_1.tscn",
	"res://Levels/Main_levels/Empty_maze_v2.tscn",
	"res://Levels/Main_levels/level_2.tscn",
	"res://Levels/Main_levels/level_3.tscn",
	"res://Levels/Main_levels/after_level_1.tscn",
	"res://Levels/Main_levels/clustered_area.tscn",
	"res://Levels/Main_levels/All_over_the_place.tscn",
	"res://Levels/Main_levels/far_away.tscn",
	"res://Levels/Main_levels/the_wall.tscn",
	"res://Levels/Main_levels/Forrest.tscn",
	"res://Levels/Main_levels/cling_on.tscn",
	"res://Levels/Main_levels/where.tscn",
	"res://Levels/Main_levels/level_4.tscn",
]

var splashes = {
	0: "Apocalypse.png",
	1: "AroundTheCorner.png",
	2: "ClingingOn.png",
	3: "Forest.png",
	4: "minigolf.png",
	5: "TheMess.png",
	6: "TheStation.png",
	7: "TheWall.png",
	8: "tutorial.png",
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
