extends Button

export(String, FILE, "*.tscn") var scene_path
export var should_use_scene_transition = false

func _ready():
	pass

func _on_Button_pressed():
	if scene_path:
		if should_use_scene_transition and $"/root/Options".use_scene_transition:
			$"/root/SceneTransition".goto_scene(scene_path)
		else:
			get_tree().change_scene(scene_path)
	else:
		print("No scene path specified for " + name + ".")
