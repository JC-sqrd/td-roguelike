class_name Stats extends Node

var actor : Unit2D
@export var stats_template : StatsTemplate
var stat_dict : Dictionary[StringName, Stat]


func initialize(actor : Unit2D):
	self.actor = actor
	stat_dict = stats_template.build_stats_from_template()
	pass

func has(stat_id : StringName) -> bool:
	return stat_dict.has(stat_id)

func get_stat(stat_id : StringName) -> Stat:
	if stat_dict.has(stat_id):
		return stat_dict[stat_id]
	return null
