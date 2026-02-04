class_name Stats extends RefCounted


var stat_dict : Dictionary[StringName, Stat]


func has(stat_id : StringName) -> bool:
	return stat_dict.has(stat_id)

func get_stat(stat_id : StringName) -> Stat:
	if stat_dict.has(stat_id):
		return stat_dict[stat_id]
	return null
