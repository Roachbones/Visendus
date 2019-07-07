extends Node2D

func _ready():
	print(get_parent())
	assert get_parent().connect("mouse_entered", get_parent().get_parent().get_node("Ides"), "_on_collision_mouse_entered", [self]) == 0
	assert get_parent().connect("mouse_exited", get_parent().get_parent().get_node("Ides"), "_on_collision_mouse_exited", [self]) == 0