class_name ProjectileAttack extends Attack

@export_flags_2d_physics var projectile_coll_mask : int
@export var scanner : Scanner2D
@export var projectile_template : ProjectileTemplate
@export var spawn_position_node : Node2D

var projectiles : Array[Projectile]

func _ready() -> void:
	super()
	scanner.collision_enter.connect(_on_scanner_collision_enter)
	scanner.collision_exit.connect(_on_scanner_collision_exit)
	attack_timer.timeout.connect(_on_attack_timer_timeout)

func start_attack():
	projectile_template.spawn_position = spawn_position_node.global_position
	var projectile : Projectile = projectile_template.build_projectile(canvas_item)
	projectile.set_body_collision_mask(projectile_coll_mask)
	projectile.effects = effects
	projectile.context = attack_context
	
	projectile.projectile_hit.connect(_on_attack_hit)
	
	ProjectileServer.add_projectile(projectile)
	attack.emit()
	end_attack()
	pass

func end_attack():
	pass


func _on_scanner_collision_enter():
	#start_attack()
	attack_timer.start(1 / attack_speed_stat.get_value())
	pass

func _on_scanner_collision_exit():
	attack_timer.stop()
	pass

func _on_attack_timer_timeout():
	start_attack()
	pass

func _on_attack_hit(hit_rid : RID):
	attack_hit.emit(EntityServer.get_entity(hit_rid))
	pass
