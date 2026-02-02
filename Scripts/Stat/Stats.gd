class_name Stats extends Resource

@export var stat_templates : Array[StatTemplate]

var stats : Dictionary[StringName, Stat]


func _init():
	build_stat_templates()
	print("Stats built from stat templates: " + str(stat_templates))
	pass

func build_stat_templates():
	for stat_template in stat_templates:
		stats[stat_template.stat_id] = stat_template.build_stat()
		pass
	pass

func get_stat(stat_id : StringName) -> Stat:
	if stats.has(stat_id):
		return stats[stat_id]
	return null
