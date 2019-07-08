extends Area2D

# warning-ignore:unused_class_variable
export(PackedScene) var next_scene

func _on_LoadingZone_body_entered(body):
	if body.is_in_group("ides"):
		assert get_tree().change_scene_to(next_scene) == OK
