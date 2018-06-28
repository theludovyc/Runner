extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export (int) var speed=50
export (PackedScene) var object=null

var thread_pop

func ready_doPop(x):
	var node=object.instance()
	node.position=Vector2(x, 0)
	add_child(node)

func thread_doPop(userData):
	var node=object.instance()
	node.position=Vector2(get_child(get_child_count()-1).position.x+1600, 0)
	add_child(node)
	return 0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here

	ready_doPop(1600)
	ready_doPop(3200)

	thread_pop=Thread.new()

	pass

func _process(delta):
	for plat in get_children():
		plat.position+=Vector2(-1, 0)*speed*delta
		pass

	if get_child(0).position.x<=-1600:
		if thread_pop.is_active():
			thread_pop.wait_to_finish()
			thread_pop=Thread.new()
		
		thread_pop.start(self, "thread_doPop")
		get_child(0).queue_free()
	pass