extends ItemEffect


@export var bonus_ability_damage : FlatStatModifierTemplate

var modifier : FlatStatModifier

func _ready():
	super()
	pass

func _on_activated(item_effect : ItemEffect):
	var context : Dictionary[StringName, Variant] = item.holder.get_entity_context() 
	modifier = bonus_ability_damage.build_modifier(context)
	
	var ability_stats : Stats = item.holder.ability_controller.ability.ability_stats
	var ability_damage : Stat = ability_stats.get_stat(modifier.stat_id)
	print("ABILITY DAMAGE: " + str(ability_damage))
	ability_damage.add_modifier(modifier, context)
	pass


func _on_deactivated(item_effect : ItemEffect):
	var context : Dictionary[StringName, Variant] =item.holder.get_entity_context() 
	modifier = bonus_ability_damage.build_modifier(context)
	
	var ability_stats : Stats = item.holder.ability_controller.ability.ability_stats
	var ability_damage : Stat = ability_stats.get_stat(modifier.stat_id)
	ability_damage.remove_modifier(modifier, context)
	pass
