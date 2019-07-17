extends StaticBody2D

func _ready():
	pass

func bluescreen():
	for sprite in $MonitorLight.get_children():
		sprite.modulate = Color(0, 0, 1, 0.7)