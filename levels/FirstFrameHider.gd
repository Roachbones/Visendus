extends ColorRect

var f = false

func _ready():
	visible = true

func _process(_delta):
	if f:
		queue_free()
	else:
		f = true
