extends Node


var _bullet: Bullet = null
var _player: Player = null

# Keep track of if the body just swapped
var just_swapped = false

func set_player(player: Player):
	_player = player
func get_player() -> Player:
	return _player
func kill_player():
	_player.queue_free()
	_player = null

func add_bullet(bullet: Bullet):
	_bullet = bullet
func get_newest_bullet() -> Bullet:
	return _bullet

func add_exception_body(node: Node2D):
	if _bullet != null:
		_bullet.add_collision_exception_with(node)
