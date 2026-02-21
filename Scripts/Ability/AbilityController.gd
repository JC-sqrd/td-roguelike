class_name AbilityController extends Node

var caster : Entity

@export var ability : Ability

@export var required_charge : float = 100
var curr_charge : float = 0


func initialize(caster : Entity, context : Dictionary[StringName,Variant], args : Dictionary):
	self.caster = caster
	ability.activate(caster, context, args)
	pass
