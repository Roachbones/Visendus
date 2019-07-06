extends KinematicBody2D

export(int) var speed = 512
export(float) var rotation_speed = 0.01
export(float) var adjustment_angle = PI * 0.7

var target_rotation = 0
var collision: KinematicCollision2D

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if rotation <= target_rotation:
		collision = move_and_collide(Vector2(1, 0).rotated(rotation))
		if collision:
			target_rotation += adjustment_angle
	else:
		rotation += rotation_speed