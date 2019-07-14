extends CheckBox

func _ready():
	pressed = $"/root/Options".seer_rays_enabled

func _on_SightLinesCheckBox_toggled(_button_pressed):
	$"/root/Options".seer_rays_enabled = pressed
