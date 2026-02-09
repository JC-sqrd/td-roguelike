class_name ProjectileAttack extends Attack


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
	projectile.effects = effects
	ProjectileServer.add_projectile(projectile)
	end_attack()
	pass

func end_attack():
	pass

func _physics_process(delta: float) -> void:
	pass

func simulate_projectiles(delta : float):
	if projectiles.size() == 0:
		return
	
	for p in projectiles:
		p.velocity = Vector2(p.direction.x * p.speed * delta, p.direction.y * p.speed * delta)
		p.position += p.velocity
		
		var transform : Transform2D = Transform2D(0, p.position)
		RenderingServer.canvas_item_set_transform(p.canvas_item_rid, transform)
		PhysicsServer2D.body_set_state(p.body, PhysicsServer2D.BODY_STATE_TRANSFORM, transform)
		
		
		#var state : PhysicsDirectBodyState2D = PhysicsServer2D.body_get_direct_state(p.body)
		var space_state := canvas_item.get_world_2d().direct_space_state
		var params : PhysicsShapeQueryParameters2D = PhysicsShapeQueryParameters2D.new()
		
		params.shape_rid = p.shape
		params.transform = transform
		params.collide_with_areas = true
		params.collide_with_bodies = false
		params.collision_mask = 2
		
		var results = space_state.intersect_shape(params)
		for result in results:
			var area_rid : RID = result.rid
			for effect in effects:
				EffectServer.receive_effect(area_rid, effect, {})
			projectiles.erase(p)
			RenderingServer.canvas_item_clear(p.canvas_item_rid)
			p.destroy_projectile()
		
		if p.add_lifetime_counter(delta):
			projectiles.erase(p)
			RenderingServer.canvas_item_clear(p.canvas_item_rid)
			p.destroy_projectile()
		
		
		pass

func _on_scanner_collision_enter():
	attack_timer.start(attack_speed_stat.get_value())
	pass

func _on_scanner_collision_exit():
	attack_timer.stop()
	pass

func _on_attack_timer_timeout():
	start_attack()
	pass
