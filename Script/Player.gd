extends KinematicBody2D

signal touchMonster
signal touchTrou
signal goForward

export (int) var run_speed_idle = 50
export (int) var run_speed_left = 100
export (int) var run_speed_right = 50
export (int) var jump_speed = -400
export (int) var gravity = 1200

var velocity = Vector2()
var running = false
var jumping = false

func get_input():
	velocity.x = -run_speed_idle
	running=false

	if Input.is_action_just_pressed('ui_up') and is_on_floor():
		jumping = true
		velocity.y = jump_speed

	if Input.is_action_pressed('ui_right'):
		$AnimatedSprite.flip_h=false
		running=true
		velocity.x = run_speed_right
		
	if Input.is_action_pressed('ui_left'):
		$AnimatedSprite.flip_h=true
		running=true
		velocity.x = -run_speed_left

	if jumping:
		$AnimatedSprite.animation="Jump"
	elif running:
		$AnimatedSprite.animation="Run"
	else:
		$AnimatedSprite.animation="Idle"

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta

	var posTmp=position.x

	velocity = move_and_slide(velocity, Vector2(0, -1))

	posTmp=position.x-posTmp

	if is_on_floor():
		if jumping:
			jumping=false

		if posTmp>0:
			emit_signal("goForward")

	for i in range(0, get_slide_count()):
		var col = get_slide_collision(i).collider
		if col.is_in_group("Trous"):
			emit_signal("touchTrou")
		else:
			match col.name:
				"Monster":
					emit_signal("touchMonster")
		