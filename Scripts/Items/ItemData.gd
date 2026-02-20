class_name ItemData extends Resource


@export var item_name : String
@export var item_id : StringName
@export var stackable : bool = false
@export_multiline() var item_description : String
@export_multiline() var item_details : String
@export var item_scene : PackedScene


func instantiate_item() -> Item:
	var item : Item = item_scene.instantiate() as Item
	item.name = item_name
	item.item_id = item_id
	item.stackable = stackable
	item.item_description = item_description
	item.item_details = item_description
	return item
