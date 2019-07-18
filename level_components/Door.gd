extends KinematicBody2D

enum d {CLOCKWISE = 1, COUNTERCLOCKWISE = -1}
export(d) var open_direction = d.CLOCKWISE
var base_rotation
const ANGLE = PI/2
export var angle_multiplier = 1.0
const opening_time = 1 #seconds
export var opened = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if not opened:
		base_rotation = rotation
	else:
		base_rotation = rotation - ANGLE * angle_multiplier * open_direction

func open():
	if not opened:
		if $Tween.is_active():
			$Tween.stop_all()
		$Tween.interpolate_property(
			self,
			"rotation",
			null,
			base_rotation + ANGLE * angle_multiplier * open_direction,
			opening_time,
			Tween.TRANS_CUBIC,
			Tween.EASE_OUT
		)
		$Tween.start()
		opened = true
func close():
	if opened:
		if $Tween.is_active():
			$Tween.stop_all()
		$Tween.interpolate_property(
			self,
			"rotation",
			null,
			base_rotation,
			opening_time,
			Tween.TRANS_CUBIC,
			Tween.EASE_OUT
		)
		$Tween.start()
		opened = false