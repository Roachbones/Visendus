extends CheckBox

func _ready():
	pressed = OS.window_fullscreen

func _on_FullscreenCheckBox_toggled(_button_pressed):
	OS.window_fullscreen = pressed
