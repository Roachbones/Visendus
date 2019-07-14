extends Button

func _ready():
	get_tree().paused = false
	self.focus_mode = Control.FOCUS_NONE #so you don't accidentally press it with Space

func _on_Button_pressed():
	get_tree().reload_current_scene()
