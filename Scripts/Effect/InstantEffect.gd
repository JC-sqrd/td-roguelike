class_name InstantEffect extends Effect

var flat_mutators : Array[FlatStatMutator]

func _init(mutators : Array[StatMutator] = []):
	self.mutators = mutators
	pass

func apply_effect(stats : Stats, context : Dictionary = {}):
	for mutator in mutators:
		if stats.has(mutator.stat_id):
			mutator.apply_mutator(stats.get_stat(mutator.stat_id), context)
			pass
		else:
			continue
	pass
