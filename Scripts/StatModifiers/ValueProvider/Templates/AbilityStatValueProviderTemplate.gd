class_name AbilityStatValueProviderTemplate extends ValueProviderTemplate

@export var stat_id : StringName

func build_value_provider(context : Dictionary[StringName, Variant]) -> ValueProvider:
	return AbilityStatValueProvider.new(stat_id, bonus_values)
