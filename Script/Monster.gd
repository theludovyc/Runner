extends KinematicBody2D

var Helper=preload("res://Script/Helper.gd")

export (int) var jump_speed = 400
export (int) var gravity = 200

export (int) var min_cooldown = 2
export (int) var max_cooldown = 5

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var velocity = Vector2()
var attack=false

func startTimer():
	pass

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func onTimerStop():
	attack=!attack
	pass

func _physics_process(delta):
	if attack:
		if position.x<792:
			velocity.x=jump_speed
			position += velocity*delta
		
			if position.x>792:
				position.x=792
	elif position.x>0:
		velocity.x=-gravity
		position += velocity*delta

		if position.x<0:
			position.x=0
