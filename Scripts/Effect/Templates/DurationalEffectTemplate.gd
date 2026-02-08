class_name DurationalEffectTemplate extends EffectTemplate


func build_effect(context : Dictionary[StringName, Variant]) -> Effect:
	var modifier_templates : = flat_modifiers + mult_modifiers + override_modifiers
	var modifiers : Array[StatModifier]
	for template : StatModifierTemplate in modifier_templates:
		modifiers.append(template.build_modifier(context))
	return DurationalEffect.new(modifiers)
