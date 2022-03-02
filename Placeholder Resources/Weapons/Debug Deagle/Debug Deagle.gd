extends Node2D

onready var weapon = get_node("DebugDeagle")
onready var mousepos = Vector2()
onready var pos = Vector2()
var rot


func _process(delta):
	mousepos = get_global_mouse_position()
	pos = global_position
	
	look_at(get_global_mouse_position())
	
	rot = rad2deg((mousepos - pos).angle())
	
	print(rot)
	
	if(rot >= -90 and rot <=90):
		weapon.set_flip_v(false)
	else:
		weapon.set_flip_v(true)
