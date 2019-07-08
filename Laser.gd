extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var segment = SegmentShape2D.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	assert len($Line2D.points) == 2
	segment.a = $Line2D.points[0]
	segment.b = $Line2D.points[1]
	$CollisionShape2D.shape = segment
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_Laser_body_entered(body):
	if body.is_in_group("ides") and body.disguised:
		$Seer.placeholder_alert()
	if not body.is_in_group("ides"):
		pass
