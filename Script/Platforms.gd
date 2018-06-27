extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export (int) var speed=50

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	for plat in get_children():
		plat.position+=Vector2(-1, 0)*50*delta
		pass
	pass

func doPop(object):
	add_child(object)