class_name Attack extends Node

@export var scanner : Scanner2D
@export var effects_templates : Array[EffectTemplate]
@export var attack_rate_stat_template : StatTemplate
@export var attack_timer : Timer



var attack_context : Dictionary[StringName, Variant]
var attack_rate_stat : Stat
var canvas_item : CanvasItem
var effects : Array[Effect]

var can_attack : bool = false

var actor : Unit2D
var stats : Stats

func _ready():
	pass

func initialize(actor : Unit2D):
	self.actor = actor
	self.stats = actor.stats
	self.canvas_item = actor as CanvasItem
	attack_rate_stat = attack_rate_stat_template.build_stat()
	attack_context["actor"] = actor
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
