extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export (int) var speed=50

var thread_pop

var currentScene
var afterScene

func ready_doPop():
	afterScene=load("res://Scene/Scene_"+str(currentScene.getSceneAfter())+".tscn")

	var node=afterScene.instance()
	node.position=Vector2(currentScene.position.x+1600, 0)
	add_child(node)

	currentScene=node

func thread_doPop(userData):
	afterScene=load("res://Scene/Scene_"+str(currentScene.getSceneAfter())+".tscn")

	var node=afterScene.instance()
	node.position=Vector2(currentScene.position.x+1600, 0)
	add_child(node)

	currentScene=node
	return 0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here

	currentScene=get_child(0)

	ready_doPop()
	ready_doPop()

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