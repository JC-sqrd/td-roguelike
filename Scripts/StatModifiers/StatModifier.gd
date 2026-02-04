@abstract
class_name StatModifier extends RefCounted


@export var stat_id : StringName
@export var value : float = 0
@export var required_context : Array[ContextTag]

func apply_modifier(stat : Stat):
	pass

func remove_modifier(stat : Stat):
	pass
