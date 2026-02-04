@abstract
class_name StatModifierTemplate extends Resource

@export var stat_id : StringName
@export var value : float = 0
@export var required_context : Array[ContextTag]

func build_modifier() -> StatModifier:
	return null
