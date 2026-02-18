@abstract
class_name ValueProvider extends RefCounted


var bonus_value : float = 0
var bonus_values : Array[BonusValue]




func add_bonus_value(bonus_value : BonusValue):
	bonus_values.append(bonus_value)

@abstract
func get_value(context : Dictionary[StringName, Variant] = {}) -> float

func calculate_bonus_value(value, context : Dictionary[StringName, Variant] = {}) -> float:
	var bonus_value : float = 0
	for bonus in bonus_values:
		bonus_value += bonus.get_bonus_value(value, context)
		pass
	return bonus_value
