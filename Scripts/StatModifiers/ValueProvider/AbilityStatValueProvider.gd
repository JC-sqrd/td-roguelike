class_name AbilityStatValueProvider extends ValueProvider

var stat_id : StringName

func _init(stat_id : StringName, bonus_values : Array[BonusValue] = []) -> void:
	self.stat_id = stat_id
	self.bonus_values = bonus_values
	pass

func get_value(context : Dictionary[StringName, Variant] = {}) -> float:
	var ability_stats : Stats = context["ability_stats"] as Stats
	var stat_value : float = ability_stats.get_stat(stat_id).get_value()
	return stat_value + calculate_bonus_value(stat_value, context)
