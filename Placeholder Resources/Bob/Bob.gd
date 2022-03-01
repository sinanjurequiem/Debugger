#OnReady Variable Declaration
extends KinematicBody2D

###Physics Variables
export var MAX_SPEED = 100
export var ACCELERATION = 400
export var FRICTION = 400

###Animation Variables
onready var animationPlayer = $AnimationPlayer
var lastDirection = "right"

#Physics
var velocity = Vector2.ZERO

func _physics_process(delta):
	##Get Inputs
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		###Animate Run
		if input_vector.x > 0:
			animationPlayer.play("Run Right")
			lastDirection = "right"
		else:
			animationPlayer.play("Run Left") 
			lastDirection = "left"
		###Acceleration Movement
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		###Animate Idle
		if lastDirection == "right":
			animationPlayer.play("Idle Right")
		else:
			animationPlayer.play("Idle Left")
		###Friction Movement
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	#Fixing Velocity
	print(velocity)
	velocity = move_and_slide(velocity)
