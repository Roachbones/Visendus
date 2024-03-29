extends CanvasLayer

export var progress_path: NodePath
export var system_log_path: NodePath
export var node_preview_path: NodePath
export var transmission_log_path: NodePath
export var time_label_path: NodePath

var progress: ProgressBar
var system_log: RichTextLabel
var node_preview: TextureRect
var transmission_log: RichTextLabel
var time_label: Label

# Called when the node enters the scene tree for the first time.
func _ready():
	progress = get_node(progress_path)
	system_log = get_node(system_log_path)
	node_preview = get_node(node_preview_path)
	transmission_log = get_node(transmission_log_path)
	time_label = get_node(time_label_path)

func _on_Ides_scan_progress_changed(scan_progress):
	progress.value = scan_progress

func _on_Ides_logged_bbcode(bbcode: String):
	append_log(bbcode + "\n")

func _on_AnimationPlayer_logged_bbcode(bbcode):
	append_log(bbcode)

func _on_Ides_scanned_node_changed(scanned_node: Node2D):
	if scanned_node.has_node("Sprite"):
		node_preview.set_texture(scanned_node.get_node("Sprite").texture)
	elif scanned_node.has_node("AnimatedSprite"):
		node_preview.set_texture(scanned_node.get_node("AnimatedSprite").frames.get_frame(
			scanned_node.get_node("AnimatedSprite").animation, 
			0
		))

func append_transmission(bbcode: String):
	#append_bbcode gets reverted upon window resize
	transmission_log.bbcode_text += bbcode

func append_log(bbcode: String):
	system_log.bbcode_text += bbcode

func report_time():
	$"/root/Options".speedrun_segment_times[get_tree().current_scene.name] = time_label.sum_delta