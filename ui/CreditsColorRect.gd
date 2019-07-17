extends ColorRect

func _ready():
	$Credits.set_process(false)

func _on_ShowCreditsButton_pressed():
	$Tween.interpolate_property(
		self,
		"rect_position",
		null,
		rect_position - Vector2(rect_size.x, 0),
		1.2,
		Tween.TRANS_CUBIC,
		Tween.EASE_OUT)
	$Tween.start()
	#rect_position = Vector2(100,200)
	$Credits.set_process(true)

