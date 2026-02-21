extends ActiveAbility


@export_category("Projectile Template")
@export var projectile_template : ProjectileTemplate
@export var spawn_position : Node2D
@export var pierce : int = 3
@export_category("Effect Template")
@export var effect_template : EffectTemplate

@export_category("Ability Damage")
@export var ability_damage_stat_template : StatTemplate


@export_flags_2d_physics var coll_layer : int = 0
@export_flags_2d_physics var coll_mask : int = 0

var canvas_item : CanvasItem




func activate(caster : Entity, context : Dictionary[StringName,Variant], args : Dictionary = {}):
	super(caster, context, args)
	canvas_item = args["canvas_item"] as CanvasItem
	pass

func deactivate():
	pass

func start_ability(caster_stats : Stats, context : Dictionary[StringName,Variant]):
	
	context.merge(generate_ability_context(caster, ability_stats))
	
	var projectile : Projectile
	
	projectile_template.spawn_position = spawn_position.global_position
	projectile = projectile_template.build_projectile(canvas_item)
	projectile.context = context
	projectile.pierce_count = pierce
	projectile.effects.append(effect_template.build_effect(context)) 
	projectile.set_body_collision_mask(coll_mask)
	projectile.set_body_collision_layer(coll_layer)
	ProjectileServer.add_projectile(projectile)
	
	pass

func on_timer_timout():
	start_ability(caster_stats, ability_context)
	get_tree().create_timer(10).timeout.connect(on_timer_timout)
	pass

func end_ability():
	pass

func generate_ability_stats() -> Stats:
	var super_stats : Stats = super()
	super_stats.stats_template.stat_templates.append(ability_damage_stat_template)
	return super_stats
