extends KinematicBody2D

var scan_in_progress = false
var node_to_scan: Node2D
var scan_progress = 0 #out of 1
export var scan_base_speed = 0.1 #per second
export var scan_proximity_bonus = 100
var scan_speed = 0
const proximity_margin = 256

signal scan_progress_changed(scan_progress)
signal logged_bbcode(bbcode)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_collision_mouse_entered(interacted_node):
	node_to_scan = interacted_node

func _on_collision_mouse_exited(interacted_node):
	if interacted_node == node_to_scan:
		cancel_scan()
		emit_signal("logged_bbcode", "Scan failed.\n")
		print("emitting")

func cancel_scan():
	scan_in_progress = false
	node_to_scan = null
	scan_progress = 0
	emit_signal("scan_progress_changed", scan_progress)


func _process(delta):
	if scan_in_progress:
		if not Input.is_action_pressed("scan_object"):
			cancel_scan()
		else:
			scan_speed = scan_base_speed
			scan_speed += scan_proximity_bonus * 1/((position - node_to_scan.position).length() + proximity_margin)
			scan_progress += scan_speed * delta
			emit_signal("scan_progress_changed", scan_progress)
			if scan_progress >= 1:
				print("SUCCESSFULLY SCANNED ", node_to_scan)
				cancel_scan() #make this look better later
	else:
		if Input.is_action_pressed("scan_object") and node_to_scan != null:
			scan_in_progress = true #begin scan
		

export(int) var speed = 15000
var velocity = Vector2()

func get_input():
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
	if Input.is_action_just_pressed("toggle_fullscreen"): #move this later
		OS.window_fullscreen = !OS.window_fullscreen

func _physics_process(delta):
	get_input()
# warning-ignore:return_value_discarded
	move_and_slide(velocity * delta)