class_name FlatValueProvider extends ValueProvider

var value : float = 0

func _init(value : float = 0, bonus_values : Array[BonusValue] = []):
	self.value = value
	self.bonus_values = bonus_values
	pass

func get_value(context : Dictionary[StringName, Variant] = {}) -> float:
	return value + calculate_bonus_value(value, context)
