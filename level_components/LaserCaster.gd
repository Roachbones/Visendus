extends Area2D

const MAX_LENGTH = 2300
var segment = SegmentShape2D.new()
var collider: Node2D
export var fix_emission_point = false #purely visual. backs up $Line2D to whatever is behind us.
export var move_above_siblings = false

func _ready():
	if fix_emission_point:
		$RayCast2D.cast_to = Vector2(-MAX_LENGTH, 0)
		$RayCast2D.force_raycast_update()
		position += to_local($RayCast2D.get_collision_point()) + Vector2(0, 0)
	if move_above_siblings:
		get_parent().call_deferred("move_child", self, 0)
	$RayCast2D.cast_to = Vector2(MAX_LENGTH, 0)
	$CollisionShape2D.shape = segment

func _process(_delta):
	if $RayCast2D.is_colliding(): #it should, otherwise it is shooting off the level
		collider = $RayCast2D.get_collider()
		if collider.is_in_group("ides") and not collider.disguised:
			$RayCast2D.add_exception(collider)
			$RayCast2D.force_raycast_update()
			$RayCast2D.remove_exception(collider)
		segment.b = to_local($RayCast2D.get_collision_point())
		if collider.is_in_group("ides") and collider.disguised:
			$Seer.alert(collider)
	else:
		segment.b = Vector2(MAX_LENGTH, 0)
	$Line2D.points = PoolVector2Array([segment.a, segment.b])

func _on_Laser_body_entered(body):
	if body.is_in_group("ides") and body.disguised:
		$Seer.placeholder_alert()
	if not body.is_in_group("ides"):
		pass

