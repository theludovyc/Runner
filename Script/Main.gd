extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export (int) var goForwardMax=5

var score=0
var goForwardTmp=0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func restart():
	if $Scenes.thread_pop.is_active():
		$Scenes.thread_pop.wait_to_finish()

	get_tree().reload_current_scene()

func _process(delta):
	if Input.is_action_just_pressed('close'):
		if $Scenes.thread_pop.is_active():
			$Scenes.thread_pop.wait_to_finish()

		get_tree().change_scene("res://Scene/Menu.tscn")

	$Score.text=str(score)

func onTimerTimeout():
	var dif=$Player.position.x-$Monster.position.x

	if dif<100:
		score+=9
	elif dif<200:
		score+=8
	elif dif<300:
		score+=7
	elif dif<400:
		score+=6
	elif dif<500:
		score+=5
	elif dif<600:
		score+=4
	elif dif<700:
		score+=3
	elif dif<800:
		score+=2
	else:
		score+=1

func onPlayer_goForward():
	goForwardTmp+=1
	if goForwardTmp>goForwardMax:
		goForwardTmp=0
		score+=1
