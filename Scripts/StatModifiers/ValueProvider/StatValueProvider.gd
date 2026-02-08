class_name StatValueProvider extends ValueProvider


var stat : Stat

func _init(stat : Stat = null, bonus_value : float = 0):
	self.stat = stat
	self.bonus_value = bonus_value
	pass

func get_value(context : Dictionary = {}) -> float:
	return stat.get_value() + bonus_value
