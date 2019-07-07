extends TileMap
#i think we might need to move this script to a higher node when we have multiple levels?

var scan_in_progress = false
var node_to_scan: Node2D
var scan_progress = 0 #out of 1
export var scan_speed = 0.3 #per second

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_collision_mouse_entered(interacted_node):
	node_to_scan = interacted_node

func _on_collision_mouse_exited(interacted_node):
	if interacted_node == node_to_scan:
		cancel_scan()

func cancel_scan():
	scan_in_progress = false
	node_to_scan = null
	scan_progress = 0

func _process(delta):
	if scan_in_progress:
		if not Input.is_action_pressed("scan_object"):
			cancel_scan()
		else:
			scan_progress += scan_speed * delta
			print(scan_progress)
			if scan_progress >= 1:
				print("SUCCESSFULLY SCANNED ", node_to_scan)
	else:
		if Input.is_action_pressed("scan_object") and node_to_scan != null:
			scan_in_progress = true #begin scan
		

