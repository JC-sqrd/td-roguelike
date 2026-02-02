class_name StatTemplate extends Resource

@export var stat_id : StringName
@export var value : float = 0
@export var bonus_value : float = 0


func build_stat() -> Stat:
	return Stat.new(stat_id, value, bonus_value)
