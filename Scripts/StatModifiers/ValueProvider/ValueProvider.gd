class_name ValueProvider extends RefCounted


var bonus_value : float = 0
var value : float = 0


func _init(value : float = 0, bonus_value : float = 0):
	self.value = value
	self.bonus_value = bonus_value
	pass


func get_value(context : Dictionary = {}) -> float:
	return value + bonus_value
