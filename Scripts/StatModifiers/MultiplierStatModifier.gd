class_name MultiplierStatModifier extends StatModifier


func _init(multiplier_value : float):
	self.value = multiplier_value
	pass

func apply_modifier(stat : Stat):
	stat.add_multiplier(value)
	pass

func remove_modifier(stat : Stat):
	stat.add_multiplier(-value)
	pass
