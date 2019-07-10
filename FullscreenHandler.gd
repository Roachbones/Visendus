extends Node

func _ready():
	pass

func _process(_delta):
	if Input.is_action_just_pressed("toggle_fullscreen"): #move this later
		OS.window_fullscreen = !OS.window_fullscreen
