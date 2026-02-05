class_name Attack extends Node

@export var scanner : Scanner2D

var attack_speed : float = 1
var canvas_item : CanvasItem

var stats : Stats

func initialize(stats : Stats, canvas_item : CanvasItem):
	self.stats = stats
	self.canvas_item = canvas_item
	pass

func start_attack():
	pass

func end_attack():
	pass
