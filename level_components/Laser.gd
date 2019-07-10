extends Area2D

var segment = SegmentShape2D.new()

func _ready():
	assert len($Line2D.points) == 2
	segment.a = $Line2D.points[0]
	segment.b = $Line2D.points[1]
	$CollisionShape2D.shape = segment

func _physics_process(delta):
	


func _on_Laser_body_entered(body):
	if body.is_in_group("ides") and body.disguised:
		$Seer.placeholder_alert()
	if not body.is_in_group("ides"):
		pass
