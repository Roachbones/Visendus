extends Sprite

#visibility is determined by ides. everything else about the disguise is handled here

func _ready():
	pass # Replace with function body.



func _on_Ides_scanned_node_changed(scanned_node):
	texture = scanned_node.get_node("Sprite").texture #unstable
	scale = scanned_node.get_node("Sprite").scale
	rotation = scanned_node.get_node("Sprite").rotation
