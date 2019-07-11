extends StaticBody2D

func _ready():
	pass


func _on_BruceOrb_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("interact"):
		$BruceOrb.visible = false
