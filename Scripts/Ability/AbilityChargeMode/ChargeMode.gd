@abstract
class_name ChargeMode extends Resource

@export var required_charge : float = 100
@export var charge_per_trigger : float = 10



signal fully_charged()

var ability : Ability

var curr_charge_stat : Stat

func initialize(ability : Ability, abiltiy_stats : Stats):
	
	pass


func reset_charge():
	pass
