class_name ActiveAbilityChargeMode extends Node


@export var required_charge : float = 100
@export var mode : ChargeMode = ChargeOnAttackHit.new()

var required_charge_stat : Stat
var curr_charge_stat : Stat

var ability : ActiveAbility

signal fully_charged()


func initialize(ability : ActiveAbility, ability_stats : Stats):
	self.ability = ability
	
	required_charge_stat = ability_stats.get_stat("required_ability_charge")
	curr_charge_stat = ability_stats.get_stat("ability_charge")
	
	mode.initialize(ability, ability_stats)
	pass


func reset_charge():
	mode.reset_charge()
	pass
