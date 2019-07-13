extends Node2D

const MAX_LENGTH = 2300
var segment = SegmentShape2D.new()

func _ready():
	$RayCast2D.cast_to = Vector2(MAX_LENGTH, 0)

func _process(_delta):
	if $RayCast2D.is_colliding(): #it should, otherwise it is shooting off the level
		segment.b = to_local($RayCast2D.get_collision_point())
	else:
		segment.b = Vector2(MAX_LENGTH, 0)
	$Line2D.points = PoolVector2Array([segment.a, segment.b])

