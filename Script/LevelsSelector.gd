extends Node

export (int) var maxLevel = 1

var lvl = 0

func _on_next():
	if lvl==maxLevel-1:
		lvl=0
	else:
		lvl+=1

	$Background.switchLevel(lvl)
	
func _on_prev():
	if lvl==0:
		lvl=maxLevel-1
	else:
		lvl-=1
		
	$Background.switchLevel(lvl)

func startLevel():
	get_tree().change_scene("res://Scene/Lvl_"+str(lvl)+".tscn")

func _process(delta):
	if Input.is_action_just_pressed('close'):
		get_tree().quit()

	if Input.is_action_just_pressed('toggle_fullscreen'):
		OS.window_fullscreen = !OS.window_fullscreen

	if Input.is_action_just_pressed('ui_up'):
		startLevel()

	if Input.is_action_just_pressed('ui_left'):
		_on_prev()

	if Input.is_action_just_pressed('ui_right'):
		_on_next()
