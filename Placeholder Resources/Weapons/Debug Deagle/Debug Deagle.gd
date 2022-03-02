extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(get_global_mouse_position())
	if rotation_degrees > 90 && rotation_degrees <270:
		get_node("DebugDeagle").set_flip_v(true)
	elif rotation_degrees < 90 && rotation_degrees < 0 || rotation_degrees > 270 && rotation_degrees < 360:
		get_node("DebugDeagle").set_flip_v(false)
