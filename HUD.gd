extends CanvasLayer

export var progress_path: NodePath
export var system_log_path: NodePath
export var node_preview_path: NodePath

var progress: TextureProgress
var system_log: RichTextLabel
var node_preview: TextureRect

# Called when the node enters the scene tree for the first time.
func _ready():
	progress = get_node(progress_path)
	system_log = get_node(system_log_path)
	node_preview = get_node(node_preview_path)

func _on_Ides_scan_progress_changed(scan_progress):
	progress.value = scan_progress

func _on_Ides_logged_bbcode(bbcode):
	assert system_log.append_bbcode(bbcode) == OK

func _on_Ides_scanned_node_changed(scanned_node: Node2D):
	node_preview.set_texture(scanned_node.get_node("Sprite").texture) #probably unreliable