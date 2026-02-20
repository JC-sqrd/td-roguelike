class_name Attack extends Node

@export var effects_templates : Array[EffectTemplate]
@export var attack_speed_stat_template : StatTemplate
@export var attack_damage_stat_template : StatTemplate
@export var attack_timer : Timer



var attack_context : Dictionary[StringName, Variant]
var attack_damage_stat : Stat
var attack_speed_stat : Stat
var canvas_item : CanvasItem
var effects : Array[Effect]

var can_attack : bool = false

var attacker : Entity
var attack_stats : Stats

func _ready():
	pass

func initialize(attacker : Entity):
	self.attacker = attacker
	self.canvas_item = attacker.entity_2d as CanvasItem
	
	initialize_stats()
	
	attack_context = generate_attack_context(attacker, attack_stats)
	for effect_template in effects_templates:
		effects.append(effect_template.build_effect(attack_context))
	pass
	
func _on_scanner_collision_enter():
	pass

func _on_scanner_collision_exit():
	pass

func _on_attack_timer_timeout():
	pass

func start_attack():
	pass

func end_attack():
	pass

func initialize_stats():
	attack_stats = generate_attack_stats()
	add_child(attack_stats, true)
	attack_stats.initialize()
	
	attack_speed_stat = attack_stats.get_stat(attack_speed_stat_template.stat_id)
	attack_damage_stat = attack_stats.get_stat(attack_damage_stat_template.stat_id)
	pass

func generate_attack_stats() -> Stats:
	var stats : Stats = Stats.new()
	var stats_template : StatsTemplate = StatsTemplate.new()
	stats_template.stat_templates.append(attack_speed_stat_template)
	stats_template.stat_templates.append(attack_damage_stat_template)
	
	stats.stats_template = stats_template
	
	return stats

func generate_attack_context(attacker : Entity, attack_stats : Stats) -> Dictionary[StringName, Variant]:
	return {
		"attacker" : attacker,
		"attack_stats" : attack_stats
	}
