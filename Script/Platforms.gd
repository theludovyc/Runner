extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export (int) var speed=50
export (PackedScene) var object=null

func doPop(x, y):
	var node=object.instance()
	node.position=Vector2(x, y)
	add_child(node)

	print(get_child_count())

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here

	doPop(1600, 0)
	doPop(3200, 0)

	pass

func _process(delta):
	for plat in get_children():
		plat.position+=Vector2(-1, 0)*speed*delta
		pass

	if get_child(0).position.x<=-1600:
		doPop(get_child(2).position.x+1600, 0)
		get_child(0).queue_free()
	pass