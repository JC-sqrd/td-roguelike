class_name ItemEquip extends Node


var _item : Item
var enabled : bool = false

func initialize(item : Item):
	_item = item
	enabled = true
	pass


func equip():
	if !enabled:
		return
	
	_item.item_equipped.emit(_item)
	pass


func unequip():
	if !enabled:
		return
	
	_item.item_unequipped.emit(_item)
	pass
