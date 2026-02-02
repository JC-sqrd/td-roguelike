class_name Battle extends Node2D

@export var grid : Grid


func _ready() -> void:
	assert(grid != null, "Grid does not exist for Battle")
	grid.initialize()
	pass
