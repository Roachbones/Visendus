extends Sprite

#visibility is determined by ides. everything else about the disguise is handled here

func _ready():
	pass # Replace with function body.

var should_keep_rotation: bool
var base_rotation

func _on_Ides_scanned_node_changed(scanned_node):
	if scanned_node.has_node("Sprite"):
		texture = scanned_node.get_node("Sprite").texture
		scale = scanned_node.get_node("Sprite").scale * scanned_node.scale
		base_rotation = scanned_node.get_node("Sprite").rotation
	elif scanned_node.has_node("AnimatedSprite"):
		texture = scanned_node.get_node("AnimatedSprite").frames.get_frame(scanned_node.get_node("AnimatedSprite").animation, 0)
		scale = scanned_node.get_node("AnimatedSprite").scale * scanned_node.scale
		base_rotation = scanned_node.get_node("AnimatedSprite").rotation
	rotation = base_rotation
	should_keep_rotation = not scanned_node.get_node("Scannable").spinnable

func _process(_delta):
	if should_keep_rotation:
		global_rotation = base_rotation
