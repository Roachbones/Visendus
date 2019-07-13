extends CheckBox

func _ready():
	pass

func _on_SightLinesCheckBox_button_down():
	$"/root/Options".seer_rays_enabled = true
func _on_SightLinesCheckBox_button_up():
	$"/root/Options".seer_rays_enabled = false
