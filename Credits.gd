extends RichTextLabel

const credits_text = """Game made by Vivian and Dero for [i]My First Game Jam: Summer 2019[/i]

Sources used:
	Freesound.org
		[i]Acoustic guitar[/i] - frankyboomer
		[i]Alert[/i] - flowerdove2168
		[i]Cavernous drone[/i] - glueissobar
		[i]Drone dark emptiness[/i] - ceich93
		[i]Dark ambience[/i] - patricklieberkind
		[i]London underground train interior[/i] - inspectorj
		[i]Low resonant dark tone[/i] - Robinhood76	
		[i]Low pitch drone plus[/i] - benbonecan
		[i]Low pitch drone 1-3[/i] - benbonecan	
		[i]Pencil sharpener with crank[/i] - roivasugo
		[i]Sorpresa 2[/i] - poderarcano
		[i]Whispers[/i] - thanvannispen
		[i]Windchime tolling[/i] - inspectorj
	Dig.ccmixter.org
		[i]Excessive exposure[/i] - acclivity
		[i]Eyes Closed[/i] - mwic

Where can you find us??? RIGHT HERE
	Vivian
		[url=https://rose.systems/]https://rose.systems/[/url]
	Dero
		Twitter: [url=https://twitter.com/inhumanrobot]@inhumanrobot[/url]
		Instagram: [url=https://www.instagram.com/inhumanrobot/]@inhumanrobot[/url]

Thank you for playing our game.
"""
var credits_text_lines = credits_text.split("\n") as Array

var sum_delta = 0.0
const seconds_per_line = 0.1
func _ready():
	bbcode_text = ""
func _process(delta):
	sum_delta += delta
	#visible_characters = int(sum_delta * characters_per_second)
	if sum_delta > seconds_per_line:
		sum_delta = sum_delta - seconds_per_line
		bbcode_text = bbcode_text + credits_text_lines.pop_front() + "\n"
		if not credits_text_lines:
			set_process(false)
		

func _on_Credits_meta_clicked(meta):
	var err = OS.shell_open(meta)
	if (err != OK):
		print("Failed opening the link '%s'!" % meta)
