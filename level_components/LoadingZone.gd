extends Area2D

# warning-ignore:unused_class_variable
export(PackedScene) var next_scene

func _on_LoadingZone_body_entered(body):
	if body.is_in_group("ides"):
		if $"/root/Options".speedrun_mode_enabled and get_tree().get_nodes_in_group("hud"):
			get_tree().get_nodes_in_group("hud")[0].report_time()
		get_tree().change_scene_to(next_scene)
