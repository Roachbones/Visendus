extends CanvasLayer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Ides_scan_progress_changed(scan_progress):
	$ColorRect/MarginContainer/VBoxContainer/CenterContainer/TextureProgress.value = scan_progress