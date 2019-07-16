extends CheckBox

func _ready():
	pressed = $"/root/Options".music_enabled

func _on_MusicCheckBox_toggled(_button_pressed):
	$"/root/Options".music_enabled = pressed
	if not pressed:
		$"/root/MusicHandler".switch_player("none")
	else:
		$"/root/MusicHandler".switch_player("MainMenuMusicPlayer")
