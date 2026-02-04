@abstract
class_name StatModifierTemplate extends Resource

@export var stat_id : StringName
@export var value_provider_template : ValueProviderTemplate
@export var required_context : Array[ContextTag]

func build_modifier() -> StatModifier:
	return null
