extends KinematicBody2D

enum travel_modes {RIDE_PATH}

export(travel_modes) var travel_mode = travel_modes.RIDE_PATH
export(float) var speed = 100

var path_follower: PathFollow2D

# Called when the node enters the scene tree for the first time.
func _ready():
	if travel_mode == travel_modes.RIDE_PATH:
		path_follower = get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if travel_mode == travel_modes.RIDE_PATH:
		path_follower.offset += speed * delta

func _on_Seer_seen_ides(ides: Node2D):
	if not ides.disguised:
		$Seer.placeholder_alert()
	else:
		match ides.scanned_node.get_node("Scannable").hud_name:
			"Potted Plant":
				if ides.velocity != Vector2.ZERO:
					$Seer.placeholder_alert()
			"Doomba":
				pass
			"Human Guard":
				if ides.scanned_node == self:
					print("You're... ME!? AAAAAAAA")
					$Seer.placeholder_alert()
