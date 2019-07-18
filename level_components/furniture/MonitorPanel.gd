extends StaticBody2D

func _ready():
	pass

func bluescreen():
	$MonitorLight.modulate = Color(0, 0, 1, 0.7)