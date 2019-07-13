extends CheckBox

func _ready():
	pass

func _on_Fullscreen_button_down():
	OS.window_fullscreen = true
func _on_FullscreenCheckbox_button_up():
	OS.window_fullscreen = false