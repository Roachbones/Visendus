extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var expended = false

const bbcode_leaf = "[color=#f5a142]Excellent! Let’s make like a you and leaf. Press [b]space[/b] to disguise yourself. Make sure you don’t move until the guard is looking the other way; I am 95% sure we don’t have any mobile plants in this part of the facility.[/color]\n"
const bbcode_steel = "[color=#f5a142]Excellent! Let's make like a you and steel away. Press [b]space[/b] to disguise yourself. Make sure you don’t move until the guard is looking the other way; I am 70% sure there are no mobile steel boxes in this part of the facility.[/color]\n"
const bbcode_guard = "[color=#f5a142]I don't think that's going to work, honey. Try the potted plant instead.[/color]\n"

signal transmission_triggered(bbcode)

func _on_ButtonPrompt_body_entered(body):
	if not expended and body.is_in_group("ides"):
		$Sprite.visible = true

func _on_Ides_scanned_node_changed(scanned_node):
	if not expended:
		if scanned_node.get_node("Scannable").hud_name == "Potted Plant":
			emit_signal("transmission_triggered", bbcode_leaf)
			$Sprite.visible = false
			expended = true
		elif scanned_node.get_node("Scannable").hud_name == "Steel Box": #you cannot escape the puns
			emit_signal("transmission_triggered", bbcode_steel)
			$Sprite.visible = false
			expended = true
		else: #scanned the guard
			emit_signal("transmission_triggered", bbcode_guard)
