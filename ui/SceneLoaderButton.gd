extends Button

export(PackedScene) var next_scene

func _ready():
	pass

func _on_Button_pressed():
	get_tree().change_scene_to(next_scene)
