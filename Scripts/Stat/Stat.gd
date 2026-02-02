class_name Stat extends RefCounted

var stat_id : StringName
var value : float = 0
var bonus_value : float = 0

signal value_changed(stat : Stat)

func _init(stat_id : StringName, stat_value : float, bonus_value : float = 0):
	self.stat_id = stat_id
	self.value = stat_value
	self.bonus_value = bonus_value
	pass

func add(value : float):
	self.value += value
	value_changed.emit(self)
	pass

func set_value(value : float):
	self.value = value
	value_changed.emit(self)
	pass

func get_value()-> float:
	return value

func get_derived_value() -> float:
	return value + bonus_value

func add_bonus_value(value : float):
	self.bonus_value += value
	pass
