class_name UnitData extends RefCounted


var stats : Stats
var unit_tile_size : Vector2i = Vector2i(1,1)


func _init(stats : Stats, unit_size : Vector2i):
	self.stats = stats
	self.unit_tile_size = unit_size
	pass
