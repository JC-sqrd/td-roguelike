class_name ValueProvider extends RefCounted

var value : float = 0

func _init(value : float = 0):
	self.value = value
	pass


func get_value(context : Dictionary = {}) -> float:
	return value
