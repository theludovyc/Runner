extends Node

var lvl = 0
export var maxLevel = 2

func _input(event):
	if event is InputEventKey and event.is_pressed():
		if event.scancode == KEY_RIGHT:
			_on_next()
		elif event.scancode == KEY_LEFT:
			_on_prev()

func _on_next():
	lvl += 1
	if lvl > maxLevel:
		lvl = 0
	$Background.switchLevel(lvl)
	
func _on_prev():
	lvl -= 1
	if lvl < 0:
		lvl = 2
	$Background.switchLevel(lvl)
