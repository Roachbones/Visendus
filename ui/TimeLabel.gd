extends Label

var sum_delta = 0.0
const CERTAINTY = 5

func _ready():
	pass

func _process(delta):
	sum_delta += delta
	text = seconds_to_string(sum_delta)

func seconds_to_string(seconds): #I miss Python
	var minutes = floor(seconds/60)
	while seconds > 60:
		seconds = seconds - 60
	var seconds_string = String(seconds)
	if seconds < 10:
		seconds_string = "0" + seconds_string
	if seconds_string.find(".") == -1: #for some reason String(0.0) == "0"
		seconds_string = seconds_string + "."
	seconds_string = seconds_string.left(CERTAINTY)
	while seconds_string.length() < CERTAINTY:
		seconds_string = seconds_string + "0"
	return String(minutes) + ":" + seconds_string
	
	
	

