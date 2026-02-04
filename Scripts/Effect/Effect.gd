@abstract
class_name Effect extends RefCounted

var modifiers : Array[StatModifier]

var flat_modifiers : Array[FlatStatModifier]
var mult_modifiers : Array[MultiplierStatModifier]
var override_modifiers : Array[OverrideStatModifier]



func _init(modifiers : Array[StatModifier] = []):
	self.modifiers = modifiers
	pass

func apply_effect(stats : Stats, context : Dictionary = {}):
	pass

func add_modifier(modifier : StatModifier):
	if modifier is FlatStatModifier:
		flat_modifiers.append(modifier)
		modifiers.clear()
		modifiers.append_array(flat_modifiers)
		modifiers.append_array(mult_modifiers)
		modifiers.append_array(override_modifiers)
	elif modifier is MultiplierStatModifier:
		mult_modifiers.append(modifier)
		modifiers.clear()
		modifiers.append_array(flat_modifiers)
		modifiers.append_array(mult_modifiers)
		modifiers.append_array(override_modifiers)
	else:
		override_modifiers.append(modifier)
		modifiers.clear()
		modifiers.append_array(flat_modifiers)
		modifiers.append_array(mult_modifiers)
		modifiers.append_array(override_modifiers)
	pass

func set_modifiers(modifiers : Array[StatModifier]):
	self.modifiers = modifiers
	pass

func _to_string() -> String:
	return "Effect modifiers: FLAT: " + str(flat_modifiers) + " MULT: " + str(mult_modifiers) + " OVERRIDE: " + str(override_modifiers)
