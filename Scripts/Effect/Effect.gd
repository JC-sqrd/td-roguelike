@abstract
class_name Effect extends RefCounted

var modifiers : Array[StatModifier]

func _init(modifiers : Array[StatModifier] = []):
	self.modifiers = modifiers
	pass

func apply_effect(stats : Stats):
	pass

func add_modifier(modifier : StatModifier):
	modifiers.append(modifier)
	pass

func set_modifiers(modifiers : Array[StatModifier]):
	self.modifiers = modifiers
	pass
