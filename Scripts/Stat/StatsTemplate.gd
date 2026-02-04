class_name StatsTemplate extends Resource

@export var stat_templates : Array[StatTemplate]

var stats : Dictionary[StringName, Stat]


func build_stats_from_template() -> Stats:
	var stats : Stats = Stats.new()
	for stat_template in stat_templates:
		stats.stat_dict[stat_template.stat_id] = stat_template.build_stat()
		pass
	return stats

func build_stat_templates():
	for stat_template in stat_templates:
		stats[stat_template.stat_id] = stat_template.build_stat()
		pass
	pass

func has(stat_id : StringName) -> bool:
	return stats.has(stat_id)

func get_stat(stat_id : StringName) -> Stat:
	if stats.has(stat_id):
		return stats[stat_id]
	return null
