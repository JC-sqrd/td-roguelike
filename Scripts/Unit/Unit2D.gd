class_name Unit2D extends Area2D


@export var unit_tile_size : int = 1
@export var unit_data : UnitData
@export var unit_sprite : Sprite2D

var _stats : Stats

var health_manager : HealthManager

@export var offsets : Array[Vector2i] = [Vector2i(0,0)]  

func _ready() -> void:
	#stats.build_stat_templates()
	unit_data.stats.build_stat_templates()
	_stats = unit_data.stats
	
	#Initialize health manager
	health_manager = HealthManager.new(_stats.get_stat("max_health"), _stats.get_stat("current_health"))
	
	var effect_listener : EffectListener = EffectListener.new(_stats)
	
	
	var damage_effect : InstantEffect = InstantEffect.new()
	var damage_modifier : FlatStatModifier = FlatStatModifier.new("current_health",50, FlatStatModifier.Mode.SUBTRACT)
	
	damage_effect.add_modifier(damage_modifier)
	
	effect_listener.receive_effect(damage_effect)
	pass


func scale_tile_sprite(tile_size : Vector2):
	if unit_sprite != null:
		var target_scale : Vector2 = Vector2(tile_size.x / unit_sprite.texture.get_width(), tile_size.y / unit_sprite.texture.get_height())
		unit_sprite.scale = target_scale
		print("Unit Sprite scaled")
	pass
