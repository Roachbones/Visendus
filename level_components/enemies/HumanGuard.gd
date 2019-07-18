extends KinematicBody2D

enum travel_modes {STATIONARY, RIDE_PATH, OSCILLATE, STARE, SPIN}

export(travel_modes) var travel_mode = travel_modes.STATIONARY
export(float) var speed = 100
export(float) var oscillation_speed = 1
export(float) var oscillation_angle = 1 #radians
export(float) var spin_speed = 1
export(NodePath) var stare_target_path
var stare_target

var path_follower: PathFollow2D

var primary_rotation
var oscillation_time_elapsed = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	if travel_mode == travel_modes.RIDE_PATH:
		path_follower = get_parent()
	primary_rotation = rotation
	stare_target = get_node(stare_target_path)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if travel_mode == travel_modes.RIDE_PATH:
		path_follower.offset += speed * delta
	if travel_mode == travel_modes.OSCILLATE:
		oscillation_time_elapsed += delta
		rotation = sin(oscillation_speed * oscillation_time_elapsed) * oscillation_angle + primary_rotation
	if travel_mode == travel_modes.SPIN:
		rotation += spin_speed * delta
	if travel_mode == travel_modes.STARE:
		rotation = position.direction_to(stare_target.global_position).angle()

func _on_Seer_seen_ides(ides: Node2D):
	if not ides.disguised:
		$Seer.alert(ides)
	else:
		match ides.scanned_node.get_node("Scannable").hud_name:
			"Potted Plant":
				if ides.velocity != Vector2.ZERO:
					$Seer.alert(ides)
			"Doomba":
				pass
			"Human Guard":
				if ides.scanned_node == self:
					if ides.mortal: #otherwise we flood stdout
						#print("You're... ME!? AAAAAAAA")
						ides.emit_signal("logged_bbcode", inspect_self_dialog())
					$Seer.alert(ides)
			"Switch":
				$Seer.alert(ides)
			"Sentinel":
				$Seer.alert(ides)
			"Steel Box":
				if ides.velocity != Vector2.ZERO:
					$Seer.alert(ides)
			"Shelves":
				$Seer.alert(ides)

func inspect_self_dialog():
	var DIALOG_PREFIX = "Dialog interpreted: "
	var quotes = [
		"You're... ME!? AAAA",
		"You're... ME!? AAAAAAAA",
		"You're... ME!? AAAAAAAAAAAAAAAA",
		"You're me?? BUT I'M ME!!",
		"I-Impossible! ...I am very handsome.",
		"My identical twin is alive!?? No, that's just a hologram. Sigh.",
		"Doppelgänger!?"
	]
	var log_choices = []
	for quote in quotes:
		log_choices.append(DIALOG_PREFIX + "\"" + quote + "\"")
	log_choices.append("[i]The guard looks at you thoughtfully and cleans the spinach from between their teeth. Then they stomp you to pieces.[/i]")
	return log_choices[randi() % len(log_choices)]

func _on_LoseAura_body_entered(body):
	if body.is_in_group("ides"):
		$Seer.alert(body)
