extends StaticBody2D

export var upper_pupil_speed = 0.22
export var lower_pupil_speed = 0.09

onready var pupils = [$UpperPupil, $LowerPupil]

func _ready():
	for pupil in pupils:
		pupil.get_node("LaserCaster").get_node("RayCast2D").add_exception(self)

func _process(delta):
	$UpperPupil.rotation += upper_pupil_speed * delta
	$LowerPupil.rotation += lower_pupil_speed * delta
	for pupil in pupils:
		pupil.get_node("Sprite").rotation = -pupil.rotation
