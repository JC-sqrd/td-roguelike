class_name InstantEffectTemplate extends EffectTemplate


func build_effect() -> Effect:
	var modifier_templates : = flat_modifiers + mult_modifiers + override_modifiers
	var modifiers : Array[StatModifier]
	for template in modifier_templates:
		modifiers.append(template.build_modifier())
	return InstantEffect.new(modifiers)
