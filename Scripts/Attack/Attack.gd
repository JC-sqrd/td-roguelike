class_name Attack extends Node

@export var scanner : Scanner2D
@export var attack_rate : float = 1
@export var attack_timer : Timer

var attack_speed : float = 1
var canvas_item : CanvasItem

var can_attack : bool = false

var stats : Stats

func initialize(stats : Stats, canvas_item : CanvasItem):
	self.stats = stats
	self.canvas_item = canvas_item
	pass

func _on_scanner_collision_enter():
	pass

func _on_scanner_collision_exit():
	pass

func _on_attack_timer_timeout():
	pass

func start_attack():
	pass

func end_attack():
	pass
