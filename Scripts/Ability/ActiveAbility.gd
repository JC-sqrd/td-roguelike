class_name ActiveAbility extends Ability

@export var charge_mode : ActiveAbilityChargeMode


func activate(caster : Entity, context : Dictionary[StringName,Variant], args : Dictionary = {}):
	self.caster = caster
	self.caster_stats = caster.stats
	self.ability_context = context
	
	ability_stats = generate_ability_stats()
	
	add_child(ability_stats)
	ability_stats.initialize()
	
	ability_context = generate_ability_context(caster, ability_stats)
	
	charge_mode.initialize(self, ability_stats)
	charge_mode.mode.fully_charged.connect(on_fully_charged)
	
	pass

func deactivate():
	pass

func start_ability(caster_stats : Stats, context : Dictionary[StringName,Variant]):
	pass

func end_ability():
	pass

func on_fully_charged():
	start_ability(caster_stats, ability_context)
	charge_mode.reset_charge()
	pass

func generate_ability_stats() -> Stats:
	var stats_template : StatsTemplate = StatsTemplate.new()
	
	var ability_charge_stat_template : StatTemplate = StatTemplate.new()
	ability_charge_stat_template.stat_id = "ability_charge"
	ability_charge_stat_template.name = "Ability Charge"
	
	var required_ability_charge_stat_template : StatTemplate = StatTemplate.new()
	required_ability_charge_stat_template.stat_id = "required_ability_charge"
	required_ability_charge_stat_template.name = "Required Ability Charge"
	
	stats_template.stat_templates.append(ability_charge_stat_template)
	stats_template.stat_templates.append(required_ability_charge_stat_template)
	
	var stats : Stats = Stats.new()
	stats.stats_template = stats_template
	return stats

func generate_ability_context(caster : Entity, ability_stats : Stats) -> Dictionary[StringName, Variant]:
	return {
		"caster" : caster,
		"caster_stats" : caster.stats,
		"ability_stats" : ability_stats
	}
