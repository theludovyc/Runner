extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

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

#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
