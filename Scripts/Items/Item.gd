class_name Item extends Node


@export var item_equip : ItemEquip

var item_id : StringName
var stackable : bool = false
var stack : int = 1
var equipped : bool = false

var item_name : String
var item_description : String
var item_details : String

signal item_equipped(item : Item)
signal item_unequipped(item : Item)

func _ready() -> void:
	item_equip.initialize(self)
	pass
