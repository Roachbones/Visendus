extends Sprite

const speed = 1.5
var magnitude = 32 * scale.y
var sum_delta = 0
var base_position

func _ready():
	base_position = position

func _process(delta):
	sum_delta += delta
	position = base_position + Vector2(0, sin(sum_delta * speed) * magnitude).rotated(rotation)

func make_visible():
	visible = true
func make_invisible():
	visible = false