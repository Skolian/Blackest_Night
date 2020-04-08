extends KinematicBody2D

var MAX_SPEED = 100
const ACCELERATION = 200
const FRICTION = 600

var LEAFSPEED = MAX_SPEED * 2

var velocity = Vector2.ZERO
onready var AnimatedSprite = $AnimatedSprite

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
		
		
	if input_vector != Vector2.ZERO:
		if input_vector.x > 0:
			$AnimatedSprite.play("run")
			$AnimatedSprite.flip_h = false
		else:
			$AnimatedSprite.play("run")
			$AnimatedSprite.flip_h = true
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
		velocity += input_vector * ACCELERATION * delta
		velocity = velocity.clamped(MAX_SPEED)
	else:
		$AnimatedSprite.play("idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	print(velocity)
	velocity = move_and_slide(velocity)
	
func LEAFSPEED():
	MAX_SPEED = 200
