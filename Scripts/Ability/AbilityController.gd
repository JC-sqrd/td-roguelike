class_name AbilityController extends Node

var actor : Unit2D
@export var ability : Ability

func initialize(stats : Stats, context : Dictionary[StringName,Variant], args : Dictionary):
	ability.activate(stats, context, args)
	pass
