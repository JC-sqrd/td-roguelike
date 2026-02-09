class_name Projectile extends RefCounted

var parent_canvas_item : CanvasItem
var canvas_item_rid : RID
var body : RID
var shape : RID
var texture : Texture2D

var position : Vector2 = Vector2(0,0)
var velocity : Vector2 = Vector2(0,0)
var direction : Vector2 = Vector2(0,0)
var speed : float = 0
var lifetime : float = 5
var _lifetime_counter : float = 0

var effects : Array[Effect]

func _init(body : RID, shape : RID,canvas_item_rid : RID, parent_canvas_item : CanvasItem, texture : Texture2D,position : Vector2, speed : float = 0):
	self.body = body
	self.canvas_item_rid = canvas_item_rid
	self.parent_canvas_item = parent_canvas_item
	self.shape = shape
	self.texture = texture
	self.speed = speed
	self.position = position
	
	PhysicsServer2D.body_add_shape(self.body, self.shape)
	
	RenderingServer.canvas_item_set_parent(canvas_item_rid, parent_canvas_item.get_canvas())
	#RenderingServer.canvas_item_set_parent(canvas_item_rid, parent_canvas_item.get_tree().root.get_viewport_rid())
	pass


static func create_projectile(params : CreateProjectileParams) -> Projectile:
	var projectile : Projectile = Projectile.new(PhysicsServer2D.body_create(), params.shape, RenderingServer.canvas_item_create(), params.canvas_item, params.texture, params.position)
	#Physics
	projectile.set_lifettime(params.lifetime)
	projectile.set_speed(params.speed)
	projectile.set_direction(params.direction)
	#projectile.set_position(params.position)
	projectile.set_parent_canvas_item(params.canvas_item)
	PhysicsServer2D.shape_set_data(projectile.shape, params.shape_data)
	projectile.set_body_mode(PhysicsServer2D.BODY_MODE_KINEMATIC).set_body_space(params.canvas_item.get_world_2d().space)
	projectile.set_body_collision_layer(params.collision_layer)
	projectile.set_body_collision_mask(params.collision_mask)
	#Render
	RenderingServer.canvas_item_set_z_index(projectile.canvas_item_rid, 10)
	projectile.draw_projectile()
	return projectile

func add_lifetime_counter(delta : float) -> bool:
	_lifetime_counter += delta
	if _lifetime_counter >= lifetime:
		return true
	return false

func set_speed(speed : float):
	self.speed = speed
	pass

func set_position(position : Vector2):
	self.position = position
	pass

func set_direction(direction : Vector2):
	self.direction = direction
	pass

func set_lifettime(lifetime : float):
	self.lifetime = lifetime
	pass

func set_parent_canvas_item(canvas_item : CanvasItem):
	self.parent_canvas_item = canvas_item
	pass

func draw_projectile():
	RenderingServer.canvas_item_add_texture_rect(self.canvas_item_rid, Rect2(0, 0, self.texture.get_width(), self.texture.get_height()), self.texture)
	var transform : Transform2D = Transform2D(0, position) 
	RenderingServer.canvas_item_set_transform(canvas_item_rid, transform)
	pass

func set_body_mode(mode : PhysicsServer2D.BodyMode) -> Projectile:
	PhysicsServer2D.body_set_mode(self.body, mode)
	return self

func set_body_space(space : RID) -> Projectile:
	PhysicsServer2D.body_set_space(self.body, space)
	return self

func add_effect(effect : Effect):
	effects.append(effect)
	pass

func add_body_shape(shape : RID) -> Projectile:
	PhysicsServer2D.body_add_shape(self.body, shape)
	return self

func set_body_collision_layer(layer : int) -> Projectile:
	PhysicsServer2D.body_set_collision_layer(self.body, layer)
	return self

func set_body_collision_mask(mask : int) -> Projectile:
	PhysicsServer2D.body_set_collision_mask(self.body, mask)
	return self
pass

func set_canvas_item_parent(canvas_item : CanvasItem):
	RenderingServer.canvas_item_set_parent(canvas_item_rid, canvas_item.get_canvas())
	pass

func simulate_projectile(delta : float, callback_func : Callable):
	velocity = Vector2(direction.x * speed * delta, direction.y * speed * delta)
	position += velocity
	var transform : Transform2D = Transform2D(0, position)
	RenderingServer.canvas_item_set_transform(canvas_item_rid, transform)
	PhysicsServer2D.body_set_state(body, PhysicsServer2D.BODY_STATE_TRANSFORM, transform)
	
	#var state : PhysicsDirectBodyState2D = PhysicsServer2D.body_get_direct_state(p.body)
	var space_state := parent_canvas_item.get_world_2d().direct_space_state
	var params : PhysicsShapeQueryParameters2D = PhysicsShapeQueryParameters2D.new()
	
	params.shape_rid = shape
	params.transform = transform
	params.collide_with_areas = true
	params.collide_with_bodies = false
	params.collision_mask = 2
	
	var results = space_state.intersect_shape(params)
	for result in results:
		var area_rid : RID = result.rid
		for effect in effects:
			EffectServer.receive_effect(area_rid, effect, {})
		callback_func.call(self)
		destroy_projectile()
		
	if add_lifetime_counter(delta):
		callback_func.call(self)
		destroy_projectile()
		pass

func destroy_projectile():
	PhysicsServer2D.free_rid(body)
	PhysicsServer2D.free_rid(shape)
	RenderingServer.free_rid(canvas_item_rid)
	pass

func _notification(what: int) -> void:
	if what == NOTIFICATION_PREDELETE:
		PhysicsServer2D.free_rid(body)
		PhysicsServer2D.free_rid(shape)
		RenderingServer.free_rid(canvas_item_rid)
