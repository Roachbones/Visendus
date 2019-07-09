extends Node2D

#both of these are referenced by other scripts
# warning-ignore:unused_class_variable
export(String) var hud_name
# warning-ignore:unused_class_variable
export var spinnable = true

func _ready():
	if not len(get_tree().get_nodes_in_group("ides")) == 1: #if we're not with an Ides
		return
	var ides = get_tree().get_nodes_in_group("ides")[0]
	assert get_parent().connect("mouse_entered", ides, "_on_collision_mouse_entered", [get_parent()]) == 0
	assert get_parent().connect("mouse_exited", ides, "_on_collision_mouse_exited", [get_parent()]) == 0