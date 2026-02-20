class_name Item extends Node


@export var item_effect : ItemEffect

var item_id : StringName
var stackable : bool = false
var stack : int = 1
var equipped : bool = false
var holder : Entity

var item_name : String
var item_description : String
var item_details : String

signal item_equipped(item : Item)
signal item_unequipped(item : Item)


func initialize():
	pass

func equip(holder : Entity):
	if self.holder != null:
		printerr("Item cannot be equipped, it is currently equipped by: " + str(holder))
	
	self.holder = holder
	item_effect.initialize(self)
	item_equipped.emit(self)
	pass


func unequip():
	
	if holder == null:
		printerr("Item is currently unequipped")
		return
	
	item_effect.deactivate()
	item_unequipped.emit(self)
	pass
