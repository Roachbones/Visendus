extends Area2D

export(String, FILE, "*.tscn") var scene_path

func _on_LoadingZone_body_entered(body):
	if not scene_path:
		print("scene_path not set for ", name)
		return
	if body.is_in_group("ides"):
		if $"/root/Options".speedrun_mode_enabled and get_tree().get_nodes_in_group("hud"):
			get_tree().get_nodes_in_group("hud")[0].report_time()
		if $"/root/Options".use_scene_transition:
			$"/root/SceneTransition".goto_scene(scene_path)
		else:
			get_tree().change_scene(scene_path)
