extends Area2D

export(String, MULTILINE) var bbcode_dialog = "Placeholder dialog."
const BRUCE_COLOR = "f5a142"
onready var colored_bbcode_dialog = "[color=#" + BRUCE_COLOR + "]" + bbcode_dialog + "[/color]\n"
var triggered = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_DialogTrigger_body_entered(body):
	if not triggered and body == get_parent().get_node("Ides"):
		get_parent().get_node("HUD").append_transmission(colored_bbcode_dialog)
		triggered = true
