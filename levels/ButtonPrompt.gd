extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var expended = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ButtonPrompt_body_entered(body):
	if not expended and body.is_in_group("ides"):
		$Sprite.visible = true

func _on_Ides_scanned_node_changed(_scanned_node):
	$Sprite.visible = false
	expended = true
