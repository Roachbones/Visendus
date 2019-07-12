extends Node2D

export var max_peripheral_angle = 0.3
export var can_see = true #if not, we just use it for the alert (currently placeholder_alert())

var target: Node2D
var space_state: Physics2DDirectSpaceState
var collision: Dictionary

var to_target: Vector2 #normalized, direction towards target
var looking: Vector2 #normalized, direction we're looking
var peripherality: float #radians

signal seen_ides(ides)

func _ready():
	#target = get_node(target_path)
	if len(get_tree().get_nodes_in_group("ides")) == 1:
		target = get_tree().get_nodes_in_group("ides")[0]
	if can_see and $"/root/Options".seer_rays_enabled:
		$LineCasterLeft.rotation = -max_peripheral_angle
		$LineCasterRight.rotation = max_peripheral_angle
		for line_caster in [$LineCasterLeft, $LineCasterRight]:
			line_caster.get_node("RayCast2D").enabled = true
			line_caster.visible = true
	
func _process(_delta):
	$AnimatedSprite.rotation = -global_rotation

func _physics_process(_delta):
	if target == null or not can_see:
		return
	to_target = target.global_position - global_position
	looking = Vector2(cos(global_rotation), sin(global_rotation))
	peripherality = abs(looking.angle_to(to_target))
	if peripherality <= max_peripheral_angle:
		space_state = get_world_2d().direct_space_state
		collision = space_state.intersect_ray(global_position, target.global_position, [self])
		if collision.collider == target:
			emit_signal("seen_ides", target)

func alert(ides):
	placeholder_alert()
	if ides.mortal:
		$AudioStreamPlayer.play()
		ides.emit_signal("logged_bbcode", "[color=red]Mission failed.[/color]")
		#get_tree().set_pause(true)
		get_tree().call_deferred("set_pause", true) #this is probably better, right?
		

func placeholder_alert():
	$AnimatedSprite.play("alert")
	$AnimatedSprite.set_frame(0)


