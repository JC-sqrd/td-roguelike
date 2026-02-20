extends Node


var active_entities : Dictionary[Variant, Entity]



func register_entity(key : Variant, entity : Entity):
	active_entities[key] = entity

func get_entity(key : Variant) -> Entity:
	return active_entities[key]

func free_entity(key : Variant):
	if active_entities.has(key):
		active_entities.erase(key)
	else:
		printerr("Entity key is not registered")
