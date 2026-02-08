class_name ValueProviderTemplate extends Resource

@export var value : float = 0
@export var bonus_values : Array[BonusValue]


func build_value_provider(context : Dictionary[StringName, Variant]) -> ValueProvider:
	var bonus_value : float = 0
	for bonus in bonus_values:
		bonus_value += bonus.get_bonus_value(context)
	return ValueProvider.new(value, bonus_value)
