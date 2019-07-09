extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var expended = false

const bbcode = "[color=orange]Excellent! Let’s make like a you and leaf. Press [b]space[/b] to disguise yourself. Make sure you don’t move until the guard is looking the other way; I am 95% sure we don’t have any mobile plants in this part of the facility.[/color]"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

signal transmission_triggered(bbcode)

func _on_ButtonPrompt_body_entered(body):
	if not expended and body.is_in_group("ides"):
		$Sprite.visible = true

func _on_Ides_scanned_node_changed(_scanned_node):
	$Sprite.visible = false
	expended = true
	emit_signal("transmission_triggered", bbcode)
