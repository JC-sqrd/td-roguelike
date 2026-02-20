class_name ActiveAbility extends Ability




func activate(caster : Entity, context : Dictionary[StringName,Variant], args : Dictionary = {}):
	pass

func deactivate():
	pass

func start_ability(stats : Stats, context : Dictionary[StringName,Variant]):
	pass

func end_ability():
	pass

func generate_ability_stats() -> Stats:
	printerr("Calling ActiveAbility's base generate_ability_stats function")
	return null

func generate_ability_context(caster : Entity, ability_stats : Stats) -> Dictionary[StringName, Variant]:
	return {
		"caster" : caster,
		"caster_stats" : caster.stats,
		"ability_stats" : ability_stats
	}
