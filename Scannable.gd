extends Node2D

func _ready():
	assert get_parent().connect("mouse_entered", get_parent().get_parent().get_node("Ides"), "_on_collision_mouse_entered", [get_parent()]) == 0
	assert get_parent().connect("mouse_exited", get_parent().get_parent().get_node("Ides"), "_on_collision_mouse_exited", [get_parent()]) == 0