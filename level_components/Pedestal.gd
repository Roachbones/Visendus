extends StaticBody2D

signal lost_bruce

func _ready():
	pass

func _on_BruceOrb_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("interact") and (get_tree().get_nodes_in_group("ides")[0].global_position - global_position).length() < 200:
		$Sparks.emitting = true
		$BruceOrb.visible = false
		emit_signal("lost_bruce")
