extends ActiveAbility

@export var projectile_template : ProjectileTemplate
@export var effect_template : EffectTemplate
@export var spawn_position : Node2D
@export var pierce : int = 3
@export_flags_2d_physics var coll_layer : int = 0
@export_flags_2d_physics var coll_mask : int = 0

var canvas_item : CanvasItem

var stats : Stats
var context : Dictionary[StringName, Variant]

func activate(stats : Stats, context : Dictionary[StringName,Variant], args : Dictionary = {}):
	canvas_item = args["actor"] as CanvasItem
	self.stats = stats
	self.context = context
	get_tree().create_timer(5).timeout.connect(on_timer_timout)
	pass

func deactivate():
	pass

func start_ability(stats : Stats, context : Dictionary[StringName,Variant]):
	#var projectile : Projectile = projectile_template.build_projectile()
	projectile_template.spawn_position = spawn_position.global_position
	var projectile : Projectile
	projectile = projectile_template.build_projectile(canvas_item)
	projectile.pierce_count = pierce
	projectile.effects.append(effect_template.build_effect(context)) 
	projectile.set_body_collision_mask(coll_mask)
	projectile.set_body_collision_layer(coll_layer)
	ProjectileServer.add_projectile(projectile)
	pass

func on_timer_timout():
	start_ability(stats, context)
	get_tree().create_timer(5).timeout.connect(on_timer_timout)
	pass

func end_ability():
	pass
