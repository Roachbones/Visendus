extends StaticBody2D

func _ready():
	pass

func bluescreen():
	for light2d in [$MonitorLight/Light2D, $MonitorLight2/Light2D, $MonitorLight3/Light2D]:
		light2d.color = Color(0, 0, 0.8, 1)