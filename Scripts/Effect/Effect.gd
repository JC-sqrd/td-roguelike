@abstract
class_name Effect extends Resource


@export var modifiers : Array[StatModifier]


func apply_effect(stats : Stats):
	pass

func add_modifier(modifier : StatModifier):
	modifiers.append(modifier)
	pass

func set_modifiers(modifiers : Array[StatModifier]):
	self.modifiers = modifiers
	pass
