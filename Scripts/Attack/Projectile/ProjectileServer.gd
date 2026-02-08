extends Node


var projectiles : Array[Projectile]


func _ready() -> void:
	#z_index = 1
	pass


func _physics_process(delta: float) -> void:
	if projectiles.size() == 0:
		return
	
	for p in projectiles:
		p.simulate_projectiles(delta, remove_projectile)
	
	#simulate_projectiles(delta)
	
	print("TOTAL PROJECTILES: " + str(projectiles.size()))
	pass


func add_projectile(projectile : Projectile):
	projectiles.append(projectile)
	pass

func simulate_projectiles(delta : float):
	if projectiles.size() == 0:
		return
	
	for p in projectiles:
		p.velocity = Vector2(p.direction.x * p.speed * delta, p.direction.y * p.speed * delta)
		p.position += p.velocity
		#print("PROJECTILE VELOCITY: " + str(p.velocity))
		var transform : Transform2D = Transform2D(0, p.position)
		RenderingServer.canvas_item_set_transform(p.canvas_item_rid, transform)
		PhysicsServer2D.body_set_state(p.body, PhysicsServer2D.BODY_STATE_TRANSFORM, transform)
		
		
		#var state : PhysicsDirectBodyState2D = PhysicsServer2D.body_get_direct_state(p.body)
		var space_state := p.parent_canvas_item.get_world_2d().direct_space_state
		var params : PhysicsShapeQueryParameters2D = PhysicsShapeQueryParameters2D.new()
		
		params.shape_rid = p.shape
		params.transform = transform
		params.collide_with_areas = true
		params.collide_with_bodies = false
		params.collision_mask = 2
		
		var results = space_state.intersect_shape(params)
		for result in results:
			var area_rid : RID = result.rid
			#print("Projectile hit: " + str(area_rid))
			for effect in p.effects:
				EffectServer.receive_effect(area_rid, effect, {})
			projectiles.erase(p)
			p.destroy_projectile()
		
		if p.add_lifetime_counter(delta):
			projectiles.erase(p)
			p.destroy_projectile()
		
		pass

func remove_projectile(projectile : Projectile):
	projectiles.erase(projectile)
	pass
