extends ColorRect

func _ready():
	$Credits.set_process(false)
	print("rect_position: ", rect_position)
	$Tween.interpolate_property(
		self,
		"rect_position",
		Vector2(1024,0),
		Vector2(300,200),#rect_position - Vector2(rect_size.x, 0),
		1.2,
		Tween.TRANS_QUAD,
		Tween.EASE_OUT)

func _on_ShowCreditsButton_pressed():
	$Tween.start()
	#rect_position = Vector2(100,200)
	$Credits.set_process(true)

func _process(_d):
	print(rect_position)
