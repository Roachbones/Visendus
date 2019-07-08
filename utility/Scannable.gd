extends Node2D

# warning-ignore:unused_class_variable
export(String) var hud_name

func _ready():
	var ides = get_tree().get_nodes_in_group("ides")[0]
	assert get_parent().connect("mouse_entered", ides, "_on_collision_mouse_entered", [get_parent()]) == 0
	assert get_parent().connect("mouse_exited", ides, "_on_collision_mouse_exited", [get_parent()]) == 0