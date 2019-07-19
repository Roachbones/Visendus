extends Label

const CERTAINTY = 8


func _ready():
	var level_times
	if $"/root/Options":
		level_times = $"/root/Options".speedrun_segment_times
		#level_times = {"level 1":23.2223245666644, "crossroads": 4.21122139949, "no": 0.0, "SplitPath":67.1, "Tutorial":30.9912}
	if not level_times:
		text = "[times go here]"
		return
	var line
	var sum_times = 0.0
	var max_level_length = 0
	for level in level_times:
		sum_times += level_times[level]
		max_level_length = max(max_level_length, len(level))
	level_times["sum"] = sum_times
	for level in level_times:
		line = level
		while len(line) < max_level_length + 2:
			line = line + " "
		line = line + seconds_to_string(level_times[level])
		line = line + "\n"
		text = text + line
	
		
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