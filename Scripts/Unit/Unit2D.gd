class_name Unit2D extends Area2D


var unit_tile_size : Vector2i = Vector2i(1,1)
@export var unit_data_template : UnitDataTemplate
@export var unit_sprite : Sprite2D
@export var attack : Attack

var unit_data : UnitData

var stats : Stats

var health_manager : HealthManager
var context : Dictionary

@export var offsets : Array[Vector2i] = [Vector2i(0,0)]  
const EFFECT_DAMAGE = preload("uid://b64oquaqda0w0")

func _ready() -> void:
	unit_data = unit_data_template.build_unit_data()
	stats = unit_data.stats
	unit_tile_size = unit_data.unit_tile_size
	context = {"stats" : stats, "actor" : self}
	
	attack.initialize(stats, self)
	
	var effect_listener : EffectListener = EffectListener.new(stats)
	
	#Register effect listener to effect server
	EffectServer.register_effect_listener(get_rid(), effect_listener)
	
	#Initialize health manager
	health_manager = HealthManager.new(stats.get_stat("max_health"), stats.get_stat("current_health"))
	
	
	
	
	var damage_effect : InstantEffect = InstantEffect.new()
	var damage_modifier : FlatStatModifier = FlatStatModifier.new("current_health",ValueProvider.new(50), FlatStatModifier.Mode.SUBTRACT)
	var health_modifier : MultiplierStatModifier = MultiplierStatModifier.new("current_health", ValueProvider.new(-0.5))
	
	damage_effect.add_modifier(damage_modifier)
	damage_effect.add_modifier(health_modifier)
	
	print("UNIT RID: " + str(get_rid()))
	#effect_listener.receive_effect(damage_effect, context)
	#effect_listener.receive_effect(EFFECT_DAMAGE.build_effect(), {})
	await get_tree().create_timer(2).timeout
	print("START ATTACK")
	attack.start_attack()
	#EffectServer.receive_effect(get_rid(), damage_effect, context)
	pass


func scale_tile_sprite(tile_size : Vector2):
	if unit_sprite != null:
		var target_scale : Vector2 = Vector2(tile_size.x / unit_sprite.texture.get_width(), tile_size.y / unit_sprite.texture.get_height())
		unit_sprite.scale = target_scale
		print("Unit Sprite scaled")
	pass
