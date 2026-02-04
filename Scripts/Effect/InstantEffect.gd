class_name InstantEffect extends Effect


func apply_effect(stats : Stats, context : Dictionary = {}):
	for modifier in modifiers:
		if stats.has(modifier.stat_id):
			modifier.apply_modifier(stats.get_stat(modifier.stat_id), context)
			pass
		else:
			continue
	pass
