extends Node2D

export var max_peripheral_angle = 0.3
#export(NodePath) var target_path
var target: Node2D
var space_state: Physics2DDirectSpaceState
var collision: Dictionary

var to_target: Vector2 #normalized, direction towards target
var looking: Vector2 #normalized, direction we're looking
var peripherality: float #radians

func _ready():
	#target = get_node(target_path)
	target = get_parent().get_parent().get_node("Ides") #i don't like this....

func _process(_delta):
	$AnimatedSprite.rotation = -global_rotation

func _physics_process(_delta):
	if target == null:
		return
	to_target = target.global_position - global_position
	looking = Vector2(cos(global_rotation), sin(global_rotation))
	peripherality = abs(looking.angle_to(to_target))
	if peripherality <= max_peripheral_angle:
		space_state = get_world_2d().direct_space_state
		collision = space_state.intersect_ray(global_position, target.global_position, [self])
		if collision.collider == target:
			$AnimatedSprite.play("alert")
			$AnimatedSprite.set_frame(0)
		
		
