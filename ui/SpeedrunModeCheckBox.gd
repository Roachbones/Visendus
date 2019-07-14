extends CheckBox

func _ready():
	pressed = $"/root/Options".speedrun_mode_enabled

func _on_SpeedrunModeCheckBox_toggled(_button_pressed):
	$"/root/Options".speedrun_mode_enabled = pressed
