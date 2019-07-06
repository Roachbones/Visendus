extends Node2D

export var max_peripheral_angle = 0.3
export(NodePath) var target_path
onready var target = get_node(target_path) as Node2D
var space_state: Physics2DDirectSpaceState
var collision: Dictionary

var to_target: Vector2 #normalized, direction towards target
var looking: Vector2 #normalized, direction we're looking
var peripherality: float #radians


func _physics_process(_delta):
	to_target = target.global_position - global_position
	looking = Vector2(cos(global_rotation), sin(global_rotation))
	peripherality = abs(looking.angle_to(to_target))
	if peripherality <= max_peripheral_angle:
		space_state = get_world_2d().direct_space_state
		collision = space_state.intersect_ray(global_position, target.global_position, [self])
		if collision.collider == target:
			print("TARGET SPOTTED!!!!")
			$AnimatedSprite.animation = "alert"
			$AnimatedSprite.play()
		
		
