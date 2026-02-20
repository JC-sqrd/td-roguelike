class_name AbilityController extends Node

var actor : Entity
@export var ability : Ability

func initialize(caster : Entity, context : Dictionary[StringName,Variant], args : Dictionary):
	ability.activate(caster, context, args)
	pass
