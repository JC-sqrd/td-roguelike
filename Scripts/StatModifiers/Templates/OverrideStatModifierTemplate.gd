class_name OverrideStatModifierTemplate extends StatModifierTemplate


func build_modifier() -> StatModifier:
	var override_modifier : OverrideStatModifier = OverrideStatModifier.new(stat_id, value_provider_template.build_value_provider())
	return override_modifier
