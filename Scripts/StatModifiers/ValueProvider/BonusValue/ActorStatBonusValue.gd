class_name ActorStatBonusValue extends BonusValue

@export var stat_id : StringName
@export var scale_ratio : float = 1

func get_bonus_value(value : float, context : Dictionary[StringName, Variant]) -> float:
	var actor : Unit2D = context["actor"]
	return actor.stats.get_stat(stat_id).get_value() * scale_ratio
