extends Button

func _ready():
	get_tree().paused = false

func _on_Button_pressed():
	if not $"/root/SceneTransition".texture_progress.visible: #if not already loading a scene
		get_tree().reload_current_scene()
