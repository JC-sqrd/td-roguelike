class_name ValueProviderTemplate extends Resource

@export var value : float = 0
@export var bonus_values : Array[BonusValue]


func build_value_provider(context : Dictionary[StringName, Variant]) -> ValueProvider:
	return ValueProvider.new(value, bonus_values)
