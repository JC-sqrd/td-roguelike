class_name ValueProviderTemplate extends Resource

@export var value : float = 0

func build_value_provider() -> ValueProvider:
	return ValueProvider.new(value)
