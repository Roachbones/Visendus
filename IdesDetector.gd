extends Area2D

func _ready():
	pass

signal ides_detected

func _on_IdesDetector_body_entered(body):
	if body.is_in_group("ides"):
		emit_signal("ides_detected")