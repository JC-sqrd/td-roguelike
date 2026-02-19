class_name AbilityController extends Node

var actor : Unit2D
@export var ability : Ability

func initialize(caster : Unit2D, context : Dictionary[StringName,Variant], args : Dictionary):
	ability.activate(caster, context, args)
	pass
