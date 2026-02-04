class_name MultiplierStatModifierTemplate extends StatModifierTemplate


func build_modifier() -> StatModifier:
	var mult_modifier : MultiplierStatModifier = MultiplierStatModifier.new(stat_id, value)
	return mult_modifier
