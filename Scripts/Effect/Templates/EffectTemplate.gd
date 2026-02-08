@abstract
class_name EffectTemplate extends Resource

@export var flat_modifiers : Array[FlatStatModifierTemplate]
@export var mult_modifiers : Array[MultiplierStatModifierTemplate]
@export var override_modifiers : Array[OverrideStatModifierTemplate]

func build_effect(context : Dictionary[StringName, Variant]) -> Effect:
	return null
