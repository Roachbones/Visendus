extends CanvasLayer

func _ready():
	$"/root/MusicHandler".switch_player("EndScreenMusicPlayer")
	$Credits.set_process(false)
	$AnimationPlayer.play("anim")
	$"/root/MusicHandler".no_more_main_menu_music = true
