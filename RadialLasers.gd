extends Node2D

export(int) var lasers = 4
export(PackedScene) var laser_beam_scene
var laser
const radius = Vector2(200, 0)
var angle
var step = 2 * PI / lasers


func _ready():
	for i in range(lasers):
		laser = laser_beam_scene.instance()
		angle = i * step
		laser.rotation = angle
		laser.position = radius.rotated(angle)
		add_child(laser, true)
		move_child(laser, 0) #renders under the sprite