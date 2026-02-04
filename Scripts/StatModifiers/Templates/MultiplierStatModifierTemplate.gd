class_name MultiplierStatModifierTemplate extends StatModifierTemplate


func build_modifier() -> StatModifier:
	var mult_modifier : MultiplierStatModifier = MultiplierStatModifier.new(stat_id, value_provider_template.build_value_provider())
	return mult_modifier
