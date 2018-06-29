extends Node2D

var Helper=preload("res://Script/Helper.gd")

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export (Array, int) var scenes = [0]

func getSceneAfter():
	return scenes[Helper.rand_between(0, scenes.size()-1)]