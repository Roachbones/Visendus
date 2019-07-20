extends StaticBody2D

signal switched_on
signal switched_off
export var toggleable = true
export var is_switched_on = false
var ides: KinematicBody2D
const ides_range = 64

func _ready():
	update_sprite()
	if len(get_tree().get_nodes_in_group("ides")) == 1:
		ides = get_tree().get_nodes_in_group("ides")[0]

func _on_Switch_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("interact") and (ides == null or (ides.global_position - global_position).length() <= ides_range):
		if not is_switched_on or not toggleable:
			emit_signal("switched_on")
			is_switched_on = true
		else:
			emit_signal("switched_off")
			is_switched_on = false
		update_sprite()

func update_sprite():
	if toggleable:
		if is_switched_on:
			$AnimatedSprite.play("on")
		else:
			$AnimatedSprite.play("off")
	else:
		$AnimatedSprite.play("button")
