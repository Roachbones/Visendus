extends Node2D

func _ready():
	$"/root/MusicHandler".switch_player("EndScreenMusicPlayer")
	$Credits.set_process(false)
	$AnimationPlayer.play("anim")
