class_name Entity extends Node


@export var unit_tile_size : Vector2i = Vector2i(1,1)
@export var stats : Stats
@export var unit_sprite : Sprite2D
@export var attack : Attack
@export var ability_controller : AbilityController
@export var item_inventory : ItemInventory

var unit_data : UnitData

var entity_2d : Node2D
var entity_rid : RID
var health_manager : HealthManager
var context : Dictionary[StringName, Variant]

signal died(unit : Entity)



func initialize(entity_2d : Node2D, rid : RID):
	self.entity_2d = entity_2d
	self.entity_rid = rid
	stats.initialize()
	
	context = {"stats" : stats, "actor" : self}
	
	attack.initialize(self)
	
	var effect_listener : EffectListener = EffectListener.new(stats)
	
	#Register effect listener to effect server
	EffectServer.register_effect_listener(entity_rid, effect_listener)
	
	#Initialize HealthManager
	health_manager = HealthManager.new(stats.get_stat("max_health"), stats.get_stat("current_health"))
	health_manager.health_depleted.connect(_on_health_depleted)
	
	#Initialize AbilityController
	var ability_controller_args : Dictionary = {"canvas_item":entity_2d}
	ability_controller.initialize(self, {"actor" : self}, ability_controller_args)
	
	#Initialize item inventory
	item_inventory.initialize(self)
	
	pass


func scale_tile_sprite(tile_size : Vector2):
	if unit_sprite != null:
		var target_scale : Vector2 = Vector2(tile_size.x / unit_sprite.texture.get_width(), tile_size.y / unit_sprite.texture.get_height())
		unit_sprite.scale = target_scale
	pass

func die():
	died.emit(self)
	queue_free()
	pass

func _on_health_depleted():
	died.emit(self)
	pass

func _exit_tree() -> void:
	EffectServer.free_rid(entity_rid)
	pass
