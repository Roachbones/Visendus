extends Node

var loader
var wait_frames
var time_max = 500 # msec
#var current_scene
#texture_progress's visibility is used by other nodes to determine if loading is happening
onready var texture_progress = $CanvasLayer/TextureProgress

func _ready():
	pass
	#var root = get_tree().get_root()
	#current_scene = root.get_child(root.get_child_count() -1)

func goto_scene(path): # game requests to switch to this scene
	loader = ResourceLoader.load_interactive(path)
	if loader == null: # check for errors
		print("error")
		return
	set_process(true)
	get_tree().get_root().get_child(get_tree().get_root().get_child_count() -1).queue_free() # get rid of the old scene
	texture_progress.visible = true
	
	wait_frames = 1

func _process(_time):
	if loader == null:
		# no need to process anymore
		set_process(false)
		return
	if wait_frames > 0: # wait for frames to let the "loading" animation show up
		wait_frames -= 1
		return
	var t = OS.get_ticks_msec()
	while OS.get_ticks_msec() < t + time_max: # use "time_max" to control for how long we block this thread
		# poll your loader
		var err = loader.poll()
		if err == ERR_FILE_EOF: # Finished loading.
			var resource = loader.get_resource()
			loader = null
			set_new_scene(resource)
			break
		elif err == OK:
			update_progress()
		else: # error during loading
			print("error loading")
			loader = null
			break

func update_progress():
	var progress = float(loader.get_stage()) / loader.get_stage_count()
	# Update your progress bar?
	texture_progress.value = progress
	print(progress)

func set_new_scene(scene_resource):
	texture_progress.visible = false
	#current_scene = scene_resource.instance()
	#get_node("/root").add_child(current_scene)
	#get_tree().set_current_scene(current_scene)
	get_tree().change_scene_to(scene_resource)