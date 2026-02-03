class_name FlatStatModifier extends StatModifier

enum Mode {ADD = 1, SUBTRACT = -1}
@export var mode : Mode = Mode.ADD

func _init(stat_id : StringName, value : float, mode : Mode):
	self.stat_id = stat_id
	self.value = value
	self.mode = mode
	pass

func apply_modifier(stat : Stat):
	stat.add(value * mode)
	pass

func remove_modifier(stat : Stat):
	stat.add(-(value * mode))
	pass
