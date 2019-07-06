extends KinematicBody2D

export(int) var speed = 2
export(float) var rotation_speed = 0.05
export(float) var adjustment_angle = PI * 0.7

var target_rotation = 0
var collision: KinematicCollision2D

func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	rotation = fposmod(rotation, TAU)
	if target_rotation <= 0: #if done rotating for now
		collision = move_and_collide(Vector2(1, 0).rotated(rotation) * speed)
		if collision:
			target_rotation += adjustment_angle
	else:
		rotation += rotation_speed
		target_rotation -= rotation_speed