extends Node

func _ready():
	pass

func _input(event):
    if event.is_action_pressed('toggle_fullscreen'):
        OS.window_fullscreen = !OS.window_fullscreen