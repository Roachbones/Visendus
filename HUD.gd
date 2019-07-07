extends CanvasLayer

export var progress_path: NodePath
export var system_log_path: NodePath

var progress: TextureProgress
var system_log: RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	progress = get_node(progress_path)
	system_log = get_node(system_log_path)

func _on_Ides_scan_progress_changed(scan_progress):
	progress.value = scan_progress

func _on_Ides_logged_bbcode(bbcode):
	assert system_log.append_bbcode(bbcode) == OK