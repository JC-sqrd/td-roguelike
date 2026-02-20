@abstract
class_name Ability extends Node

@export var ability_id : StringName = "ability_id"
@export var ability_name : String = "Ability"

var caster : Entity
var caster_stats : Stats
var ability_stats : Stats
var ability_context : Dictionary[StringName, Variant]

@export_multiline() var ability_description : String

@export_multiline() var ability_details : String

@abstract func activate(caster : Entity, context : Dictionary[StringName,Variant], args : Dictionary = {})

@abstract func deactivate()

@abstract func start_ability(stats : Stats, context : Dictionary[StringName,Variant])

@abstract func end_ability()

@abstract
func generate_ability_stats() -> Stats

@abstract
func generate_ability_context(caster : Entity, ability_stats : Stats) -> Dictionary[StringName, Variant]

func get_ability_description() -> String:
	return ability_description

func get_ability_details() -> String:
	return ability_details
