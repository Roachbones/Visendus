extends ColorRect

var f = false

func _ready():
	pass

func _process(_delta):
	if f:
		queue_free()
	else:
		f = true
