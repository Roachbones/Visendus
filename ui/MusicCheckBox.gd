extends CheckBox

func _ready():
	pressed = $"/root/Options".music_enabled

func _on_MusicCheckBox_toggled(_button_pressed):
	$"/root/Options".music_enabled = pressed
	$"/root/MusicHandler".no_more_main_menu_music = false
	if not pressed:
		$"/root/MusicHandler".stop_all()
	else:
		$"/root/MusicHandler".switch_player("MainMenuMusicPlayer")
