extends CheckBox

func _ready():
	pressed = $"/root/Options".use_scene_transition

func _on_SceneTransitionCheckBox_toggled(_button_pressed):
	$"/root/Options".use_scene_transition = pressed
