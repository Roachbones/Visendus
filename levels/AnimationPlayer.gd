extends AnimationPlayer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal logged_bbcode(bbcode)

var bootlines = [
"INITIATING REMOTE BOOT...\n",
"Starting base instincts...", " [[color=green]OK[/color]]\n",
"Collecting sensory data...", " [[color=green]OK[/color]]\n",
"Prototype 15 online.\n"
]

# Called when the node enters the scene tree for the first time.
func _ready():
	$"/root/MusicHandler".switch_player("StandardMusicPlayer")
	play("Tutorial Intro")
	$ColorRect.visible = true

func update_log():
	emit_signal("logged_bbcode", bootlines.pop_front())
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
