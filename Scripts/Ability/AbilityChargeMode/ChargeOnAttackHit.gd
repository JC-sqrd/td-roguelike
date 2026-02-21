class_name ChargeOnAttackHit extends ChargeMode


func initialize(ability : Ability, ability_stats : Stats):
	ability.caster.attack.attack_hit.connect(_on_attack_hit)
	curr_charge_stat = ability_stats.get_stat("ability_charge")
	pass


func _on_attack_hit(entity : Entity):
	curr_charge_stat.add(charge_per_trigger)
	if curr_charge_stat.get_value() >= required_charge:
		fully_charged.emit()
		pass
	pass

func reset_charge():
	curr_charge_stat.set_value(0)
	pass
