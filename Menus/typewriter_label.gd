extends Label

func _ready():
	visible_characters = 0
	display()

func display():
	$Timer.start()

func _on_timer_timeout():
	if visible_characters < text.length():
		visible_characters += 1
		$Click.play()
		$Timer.wait_time = 0.1 + randf() * 0.2
		$Timer.start()
