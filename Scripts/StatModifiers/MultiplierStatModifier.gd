class_name MultiplierStatModifier extends StatModifier



func _init(stat_id : StringName, value : float):
	self.stat_id = stat_id
	self.value = value
	pass
	

func apply_modifier(stat : Stat):
	stat.add_multiplier(value)
	pass

func remove_modifier(stat : Stat):
	stat.add_multiplier(-value)
	pass
