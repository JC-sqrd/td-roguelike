class_name PeriodicEffect extends Effect

func apply_effect(stats : Stats, context : Dictionary = {}):
	for modifier in modifiers:
		if stats.has(modifier.stat_id):
			modifier.apply_modifier(stats.get_stat(modifier.stat_id))
			pass
		else:
			continue
	pass
