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
	if Input.is_key_pressed(KEY_ESCAPE):
		if $Scenes.thread_pop.is_active():
			$Scenes.thread_pop.wait_to_finish()

		get_tree().quit()

	if Input.is_key_pressed(KEY_SPACE):
		restart()

	if Input.is_action_pressed('toggle_fullscreen'):
		OS.window_fullscreen = !OS.window_fullscreen

#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
