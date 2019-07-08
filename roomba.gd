extends KinematicBody2D

export(int) var speed = 100
export(float) var rotation_speed = 3
export(float) var adjustment_angle = PI * 0.7

var target_rotation = 0
var collision: KinematicCollision2D

func _ready(): #bear with me here
	pass

func _physics_process(delta):
	rotation = fposmod(rotation, TAU)
	if target_rotation <= 0: #if done rotating for now
		collision = move_and_collide(Vector2(1, 0).rotated(rotation) * speed * delta)
		if collision:
			target_rotation += adjustment_angle
	else:
		rotation += rotation_speed * delta
		target_rotation -= rotation_speed * delta

#func _on_input_event(viewport, event, shape_idx):

func _on_Seer_seen_ides(ides: Node2D):
	if not ides.disguised:
		$Seer.placeholder_alert()
	else:
		match ides.scanned_node.get_node("Scannable").hud_name:
			"Potted Plant":
				pass
			"Doomba":
				pass
			"Human Guard":
				pass
