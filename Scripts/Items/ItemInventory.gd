class_name ItemInventory extends Node


@export var item_data : Array[ItemData]
@export var max_item_slot : int = 3

var items : Array[Item]
var item_dict : Dictionary[StringName, Item]
var items_count : Dictionary[StringName, int]

var entity : Entity

func initialize(entity : Entity):
	self.entity = entity
	
	for item_datum in item_data:
		var item : Item = item_datum.instantiate_item()
		add_item(item)
		pass
	
	pass

func add_item(item : Item) -> bool:
	#Is the item stackable?
	if item.stackable:
		#If it is stackable, do we already have it?
		if item_dict.has(item.item_id):
			#If we already have it, increase its stack
			item_dict[item.item_id].stack += 1
			#Free the item instance
			item.queue_free()
			pass
		else:
			#If we don't have it, do we have enough slot for a new item?
			if items.size() < max_item_slot:
				#Initialize its count
				items_count[item.item_id] = 1
				#Add it to inventory
				items.append(item)
				#Add it to the dictionary
				item_dict[item.item_id] = item
				#Add it as child
				add_child(item)
				return true
			else:
				#if we don't, we can't add it to the inventory
				printerr("Item inventory full")
				return false
		pass
	#Is the item not stackable?
	elif !item.stackable:
		#If it's not, do we already have it?
		if item_dict.has(item.item_id):
			#If we do, do we have enough space for a new item
			if items.size() < max_item_slot:
				#If we do, add it
				items.append(item)
				#Increment its count
				items_count[item.item_id] += 1
				#Add it as child
				add_child(item)
				return true
		else:
			#if we don't, do we have enough space for a new item
			if items.size() < max_item_slot:
				#If we do, add it
				items.append(item)
				#Initialize its count
				items_count[item.item_id] = 1
				#Add it to the dictionary
				item_dict[item.item_id] = item
				#Add it as child
				add_child(item)
				return true
		pass
	return false
