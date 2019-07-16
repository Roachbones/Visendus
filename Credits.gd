extends RichTextLabel

const credits_text = """
Game made by Vivian and Dero

Sources used:

Freesound.org
	[i]Alert[/i] - flowerdove2168
	[i]Drone dark emptiness[/i] - ceich93
	[i]Low resonant dark tone[/i] - Robinhood76	
	[i]Low pitch drone plus[/i] - benbonecan
	[i]Low pitch drone 1-3[/i] - benbonecan	
	[i]Pencil sharpener with crank[/i] - roivasugo
	[i]Sorpresa 2[/i] - poderarcano
	[i]Whispers[/i] - thanvannispen

Dig.ccmixter.org
	[i]Excessive exposure[/i] - acclivity
	[i]Eyes Closed[/i] - mwic

Where can you find us??? RIGHT HERE

	Vivian
		[url=https://rose.systems/]https://rose.systems/[/url]
	Dero
		Twitter: [url=https://twitter.com/inhumanrobot]@inhumanrobot[/url]
		Instagram: [url=https://www.instagram.com/inhumanrobot/]@inhumanrobot[/url]
"""


func _ready():
	pass

func _on_Credits_meta_clicked(meta):
	var err = OS.shell_open(meta)
	if (err != OK):
		print("Failed opening the link '%s'!" % meta)
