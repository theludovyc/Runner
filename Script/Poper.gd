extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export (float) var coolDown=2
export (NodePath) var parent=null
export (PackedScene) var platform=null

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here

	$Timer.wait_time=coolDown
	$Timer.start()

	pop()

	pass

func pop():
	var node=platform.instance()
	get_node(parent).add_child(node)
	node.position=position

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
