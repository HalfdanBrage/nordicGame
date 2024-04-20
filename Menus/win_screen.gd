extends CanvasLayer

@export var enable_dither = false

func _ready():
	Musicplayer.play_out()

func _process(delta):
	if enable_dither:
		var gain = $TextureRect.texture.noise.fractal_gain
		var new_gain = gain - gain * delta * 0.95
		$TextureRect.texture.noise.fractal_gain = new_gain 
