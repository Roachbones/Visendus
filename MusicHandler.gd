extends Node

onready var players = get_children()
var no_more_main_menu_music = false

func _ready():
	pass

func stop_all():
	for player in players:
		if player.playing:
			player.stop()

func switch_player(player_name):
	if no_more_main_menu_music and player_name == "MainMenuMusicPlayer":
		return
	if not $"/root/Options".music_enabled:
		return
	for player in players:
		if player.name == player_name:
			if not player.playing:
				player.play()
		elif player.playing:
			player.stop()
