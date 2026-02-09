class_name Unit2D extends Area2D


@export var unit_tile_size : Vector2i = Vector2i(1,1)
@export var stats : Stats
@export var unit_sprite : Sprite2D
@export var attack : Attack



var unit_data : UnitData



var health_manager : HealthManager
var context : Dictionary[StringName, Variant]

signal died(unit : Unit2D)

@export var offsets : Array[Vector2i] = [Vector2i(0,0)]  
const EFFECT_DAMAGE = preload("uid://b64oquaqda0w0")

func _ready() -> void:
	#stats = unit_data.stats
	stats.initialize(self)
	
	context = {"stats" : stats, "actor" : self}
	
	attack.initialize(self)
	
	var effect_listener : EffectListener = EffectListener.new(stats)
	
	#Register effect listener to effect server
	EffectServer.register_effect_listener(get_rid(), effect_listener)
	
	#Initialize health manager
	health_manager = HealthManager.new(stats.get_stat("max_health"), stats.get_stat("current_health"))
	health_manager.health_depleted.connect(_on_health_depleted)
	
	var damage_effect : InstantEffect = InstantEffect.new()
	var damage_modifier : FlatStatModifier = FlatStatModifier.new("current_health",ValueProvider.new(50), FlatStatModifier.Mode.SUBTRACT)
	var health_modifier : MultiplierStatModifier = MultiplierStatModifier.new("current_health", ValueProvider.new(-0.5))
	
	
	damage_effect.add_modifier(damage_modifier)
	damage_effect.add_modifier(health_modifier)
	
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
	queue_free()
	pass
