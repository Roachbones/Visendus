extends Area2D

export(String, MULTILINE) var bbcode_dialog = "Placeholder dialog."
const BRUCE_COLOR = "f5a142"
onready var colored_bbcode_dialog = "[color=#" + BRUCE_COLOR + "]" + bbcode_dialog + "[/color]\n"
var triggered = false
var hud

# Called when the node enters the scene tree for the first time.
func _ready():
	if get_tree().get_nodes_in_group("hud"):
		hud = get_tree().get_nodes_in_group("hud")[0]

func _on_DialogTrigger_body_entered(body):
	if not triggered and body.is_in_group("ides") and hud:
		hud.append_transmission(colored_bbcode_dialog)
		triggered = true
