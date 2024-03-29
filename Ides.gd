extends KinematicBody2D

var scan_in_progress = false
var node_to_scan: Node2D
var scan_progress = 0 #out of 1
export var scan_base_speed = 0.03 #per second
export var scan_proximity_bonus = 200
const proximity_margin = 256
var scan_speed = 0
var scanned_node: Node2D

var disguised = false
# warning-ignore:unused_class_variable
export var mortal = false

var space_state: Physics2DDirectSpaceState
var collision: Dictionary

const scan_pitch_base = 0.5
const scan_pitch_range = 0.6

signal scan_progress_changed(scan_progress) #sent to HUD
signal logged_bbcode(bbcode) #sent to HUD
signal scanned_node_changed(scanned_node) #sent to HUD and $Disguise

func _ready():
	$ScanAudioPlayer.pitch_scale = scan_pitch_base

func _process(_delta):
	pass

func _physics_process(delta):
	get_input()
# warning-ignore:return_value_discarded
	move_and_slide(velocity * delta)
	if velocity != Vector2.ZERO:
		#rotation = velocity.angle()
		if Vector2(cos(rotation), sin(rotation)).angle_to(velocity) <= 0:
			turn_direction = -1
		else:
			turn_direction = 1
		rotation += turn_direction * delta * turn_speed
		if (Vector2(cos(rotation), sin(rotation)).angle_to(velocity) <= 0) != (turn_direction <= 0): #hard to read. format better?
			rotation = velocity.angle()
		$WalkAudioPlayer.stream_paused = false
	else:
		$WalkAudioPlayer.stream_paused = true
	
	if scan_in_progress:
		if not Input.is_action_pressed("scan_object") or disguised:
			pass
		else:
			space_state = get_world_2d().direct_space_state
			collision = space_state.intersect_ray(global_position, node_to_scan.global_position, [self], 1)
			if "collider" in collision and collision.collider == node_to_scan:
				scan_speed = scan_base_speed
				scan_speed += scan_proximity_bonus * 1/((global_position - node_to_scan.global_position).length() + proximity_margin)
				scan_progress += scan_speed * delta
				emit_signal("scan_progress_changed", scan_progress)
				$ScanAudioPlayer.pitch_scale = scan_pitch_base + scan_pitch_range * scan_progress
				if scan_progress >= 1:
					scanned_node = node_to_scan
					emit_signal("logged_bbcode", "Scanned [b]" + scanned_node.get_node("Scannable").hud_name + "[/b].")
					emit_signal("scanned_node_changed", scanned_node)
					cancel_scan() #make this look better later
	else:
		if Input.is_action_pressed("scan_object") and node_to_scan != null:
			scan_in_progress = true #begin scan
			$ScanAudioPlayer.play()

func _on_collision_mouse_entered(interacted_node):
	node_to_scan = interacted_node

func _on_collision_mouse_exited(interacted_node):
	if interacted_node == node_to_scan:
		if scan_in_progress:
			emit_signal("logged_bbcode", "Scan failed.")
		cancel_scan()

func cancel_scan():
	scan_in_progress = false
	node_to_scan = null
	scan_progress = 0
	emit_signal("scan_progress_changed", scan_progress)
	$ScanAudioPlayer.stop()
	$ScanAudioPlayer.pitch_scale = scan_pitch_base

export(int) var speed = 15000
export var turn_speed = 20 #just visual
var velocity = Vector2()
var turn_direction: int
export var immobile = false

func get_input():
	if not immobile:
		velocity = Vector2()
		if Input.is_action_pressed('ui_right'):
			velocity.x += 1
		if Input.is_action_pressed('ui_left'):
			velocity.x -= 1
		if Input.is_action_pressed('ui_down'):
			velocity.y += 1
		if Input.is_action_pressed('ui_up'):
			velocity.y -= 1
		velocity = velocity.normalized() * speed
		disguised = Input.is_action_pressed("disguise") and scanned_node != null
		$Disguise.visible = disguised
		
	

