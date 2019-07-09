extends Sprite

#visibility is determined by ides. everything else about the disguise is handled here

func _ready():
	pass # Replace with function body.

var should_keep_rotation: bool
var base_rotation

func _on_Ides_scanned_node_changed(scanned_node):
	texture = scanned_node.get_node("Sprite").texture #unstable
	scale = scanned_node.get_node("Sprite").scale
	base_rotation = scanned_node.get_node("Sprite").rotation
	rotation = base_rotation
	should_keep_rotation = not scanned_node.get_node("Scannable").spinnable

func _process(_delta):
	if should_keep_rotation:
		global_rotation = base_rotation
