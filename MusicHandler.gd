extends Node

onready var players = get_children()

func _ready():
	pass

func stop_all():
	for player in players:
		if player.playing:
			player.stop()

func switch_player(player_name):
	stop_all()
	for player in players:
		if player.name == player_name:
			player.play()
			break
