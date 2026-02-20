class_name ItemEquip extends Node


var _item : Item
var holder : Entity
var enabled : bool = false

func initialize(item : Item):
	_item = item
	enabled = true
	pass
