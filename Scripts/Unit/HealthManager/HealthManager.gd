class_name HealthManager extends RefCounted

var max_health : Stat
var current_health : Stat


func _init(max_health : Stat, current_health : Stat):
	self.max_health = max_health
	self.current_health = current_health
	self.current_health.set_value(max_health.get_value())
	current_health.value_changed.connect(_on_current_health_value_changed)
	pass

signal health_depleted()


func _on_current_health_value_changed(current_health_stat : Stat):
	if current_health_stat.get_value() <= 0:
		health_depleted.emit()
	pass

func add_health(value : float):
	current_health.add(value)
	evaluate_health()
	pass

func decrease_health(value : float):
	current_health.add(-value)
	evaluate_health()

func evaluate_health():
	if current_health.get_derived_value() <= 0:
		health_depleted.emit()


func get_health() -> float:
	return current_health.get_derived_value()
