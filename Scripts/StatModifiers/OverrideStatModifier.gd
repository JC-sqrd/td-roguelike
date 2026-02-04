class_name OverrideStatModifier extends StatModifier


var old_value : float = 0

func _init(stat_id : StringName, value : float):
	self.value = value
	pass

func apply_modifier(stat : Stat):
	old_value = stat.get_value()
	stat.set_value(value)
	pass

func remove_modifier(stat : Stat):
	stat.set_value(old_value)
	pass
