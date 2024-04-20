extends CanvasLayer

var text = ""

func _ready():
	$MarginContainer/TypewriterLabel.text = text

func display():
	$MarginContainer/TypewriterLabel.display()
	$AnimationPlayer.play("display")
