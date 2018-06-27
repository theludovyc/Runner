extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

signal pop(a)

export (float) var coolDown=2
export (PackedScene) var object=null

func doPop():
	var node=object.instance()
	node.position=position
	emit_signal("pop", node)

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here

	$Timer.wait_time=coolDown
	$Timer.start()

	doPop()

	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
