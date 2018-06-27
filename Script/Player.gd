extends KinematicBody2D

export (int) var run_speed = 100
export (int) var jump_speed = -400
export (int) var gravity = 1200

var velocity = Vector2()
var jumping = false

func get_input():
	velocity.x = 0

	if Input.is_action_just_pressed('ui_up') and is_on_floor():
		jumping = true
		$AnimatedSprite.animation="Jump"
		velocity.y = jump_speed

	if Input.is_action_pressed('ui_right'):
		$AnimatedSprite.flip_h=false
		velocity.x += run_speed
		
	if Input.is_action_pressed('ui_left'):
		$AnimatedSprite.flip_h=true
		velocity.x -= run_speed

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta

	velocity = move_and_slide(velocity, Vector2(0, -1))

	if is_on_floor():
		if jumping:
			jumping=false

		if velocity.length()>1:
			$AnimatedSprite.animation="Run"
		else:
			$AnimatedSprite.animation="Idle"
