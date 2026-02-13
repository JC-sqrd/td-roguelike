@abstract
class_name Ability extends Node

@export var ability_id : StringName = "ability_id"
@export var ability_name : String = "Ability"

@export_multiline() var ability_description : String

@export_multiline() var ability_details : String

@abstract func activate(stats : Stats, context : Dictionary)

@abstract func deactivate()

@abstract func start_ability(stats : Stats, context : Dictionary)

@abstract func end_ability()

func get_ability_description() -> String:
	return ability_description

func get_ability_details() -> String:
	return ability_details
