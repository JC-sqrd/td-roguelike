class_name OverrideStatModifierTemplate extends StatModifierTemplate


func build_modifier() -> StatModifier:
	var override_modifier : OverrideStatModifier = OverrideStatModifier.new(stat_id, value)
	return override_modifier
