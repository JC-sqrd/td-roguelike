class_name FlatStatModifierTemplate extends StatModifierTemplate

@export var mode : FlatStatModifier.Mode = FlatStatModifier.Mode.ADD

func build_modifier() -> StatModifier:
	var flat_modifier : FlatStatModifier = FlatStatModifier.new(stat_id, value, mode)
	return flat_modifier
