class_name ItemEffect extends Node

var item : Item
var active : bool = false

signal item_effect_activated(item_effect : ItemEffect)
signal item_effect_deactivated(item_effect : ItemEffect)


func _ready() -> void:
	item_effect_activated.connect(_on_activated)
	item_effect_deactivated.connect(_on_deactivated)

func initialize(item : Item):
	self.item = item
	activate()
	pass

func activate():
	active = true
	item_effect_activated.emit(self)
	pass

func deactivate():
	active = false
	item_effect_deactivated.emit(self)
	pass

func _on_activated(item_effect : ItemEffect):
	
	pass

func _on_deactivated(item_effect : ItemEffect):
	
	pass
