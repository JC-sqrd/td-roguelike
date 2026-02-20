class_name UnitMovement extends Node

@export var speed : float = 0
var direction : Vector2 = Vector2(-1,0)
var velocity : Vector2 = Vector2(0,0)

var unit : Unit
var active : bool = false

func initialize(unit : Unit):
	self.unit = unit
	active = true
	pass

func _physics_process(delta: float) -> void:
	if !active:
		return 
	pass
