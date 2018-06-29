extends Sprite

var levels = [
	preload("res://Art/paint_1.png"),
	preload("res://Art/paint_2.png"),
	preload("res://Art/paint_3.png")
]
	
func _ready():
	centered = false
	texture = levels[0]
	
func switchLevel(lvl):
	texture = levels[lvl]