extends KinematicBody2D

enum d {CLOCKWISE = 1, COUNTERCLOCKWISE = -1}
export(d) var open_direction = d.CLOCKWISE
var base_rotation
const ANGLE = PI/2
const opening_time = 1 #seconds
export var opened = false

# Called when the node enters the scene tree for the first time.
func _ready():
	base_rotation = rotation

func open():
	print("opening")
	if not opened:
		if $Tween.is_active():
			$Tween.stop_all()
		$Tween.interpolate_property(
			self,
			"rotation",
			null,
			base_rotation + ANGLE * open_direction,
			opening_time,
			Tween.TRANS_CUBIC,
			Tween.EASE_OUT
		)
		$Tween.start()
		opened = true
func close():
	print("closing")
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
		if $Tween.is_active():
			$Tween.stop_all()
		$Tween.start()
		opened = false