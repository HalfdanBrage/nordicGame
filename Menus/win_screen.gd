extends CanvasLayer

@export var enable_dither = false

func _ready():
	Musicplayer.play_out()

func _process(delta):
	for sfx in get_tree().get_nodes_in_group("sfx"):
		sfx.volume_db -= 15 * delta
	if enable_dither:
		var gain = $TextureRect.texture.noise.fractal_gain
		var new_gain = gain - gain * delta * 0.5
		$TextureRect.texture.noise.fractal_gain = new_gain 

func start_next_level():
	if Levelmanager.has_next_level():
		Levelmanager.play_next_level()
		
func pause():
	Levelmanager._pause()

func unpause():
	Levelmanager._unpause()
