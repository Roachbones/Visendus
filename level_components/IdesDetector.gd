extends Area2D

func _ready():
	pass

signal ides_detected
export var activated = true

func activate():
	activated = true

func _on_IdesDetector_body_entered(body):
	if activated and body.is_in_group("ides"):
		emit_signal("ides_detected")