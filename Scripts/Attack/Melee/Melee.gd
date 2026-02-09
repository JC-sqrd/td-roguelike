class_name Melee extends RefCounted

var parent_canvas_item : CanvasItem
var canvas_item_rid : RID
var area : RID
var shape : RID
var texture : Texture2D

var position : Vector2 = Vector2(0,0)
var direction : Vector2 = Vector2(0,0)

var active_frames : int = 3
var _frame_counter : int = 0

var effects : Array[Effect]

var hits : Array[RID]

func _init(area : RID, shape : RID,canvas_item_rid : RID, parent_canvas_item : CanvasItem, texture : Texture2D,position : Vector2, speed : float = 0):
	self.area = area
	self.canvas_item_rid = canvas_item_rid
	self.parent_canvas_item = parent_canvas_item
	self.shape = shape
	self.texture = texture
	self.position = position
	
	PhysicsServer2D.area_add_shape(self.area, self.shape)
	
	RenderingServer.canvas_item_set_parent(canvas_item_rid, parent_canvas_item.get_canvas())
	pass

static func create_melee(params : CreateMeleeParams) -> Melee:
	var melee : Melee = Melee.new(PhysicsServer2D.area_create(), params.shape, RenderingServer.canvas_item_create(), params.canvas_item, params.texture, params.position)
	#Physics
	melee.set_active_frames(params.active_frames)
	melee.set_direction(params.direction)
	melee.set_position(params.position)
	melee.set_parent_canvas_item(params.canvas_item)
	PhysicsServer2D.shape_set_data(melee.shape, params.shape_data)
	melee.set_area_space(params.canvas_item.get_world_2d().space)
	melee.set_area_collision_layer(params.collision_layer)
	melee.set_area_collision_mask(params.collision_mask)
	#Render
	RenderingServer.canvas_item_set_z_index(melee.canvas_item_rid, 11)
	melee.draw_melee()
	return melee

func set_active_frames(active_frames : int):
	self.active_frames = active_frames
	pass

func set_direction(direction : Vector2):
	self.direction = direction
	pass

func set_position(position : Vector2):
	self.position = position
	pass

func set_parent_canvas_item(parent_canvas_item : CanvasItem):
	RenderingServer.canvas_item_set_parent(canvas_item_rid, parent_canvas_item)
	pass

func set_area_mode(mode : PhysicsServer2D.BodyMode) -> Melee:
	PhysicsServer2D.body_set_mode(self.area, mode)
	return self

func set_area_space(space : RID) -> Melee:
	PhysicsServer2D.area_set_space(self.area, space)
	return self

func set_area_collision_layer(layer : int) -> Melee:
	PhysicsServer2D.area_set_collision_layer(self.area, layer)
	return self

func set_area_collision_mask(mask : int) -> Melee:
	PhysicsServer2D.area_set_collision_mask(self.area, mask)
	return self

func draw_projectile():
	print("DRAW MELEE TEXTURE")
	RenderingServer.canvas_item_add_texture_rect(self.canvas_item_rid, Rect2(0, 0, self.texture.get_width(), self.texture.get_height()), self.texture)
	var transform : Transform2D = Transform2D(0, position) 
	RenderingServer.canvas_item_set_transform(canvas_item_rid, transform)
	pass

func simulate_attack(delta : float, callback_func : Callable):
	hits.clear()
	#velocity = Vector2(direction.x * speed * delta, direction.y * speed * delta)
	#position += velocity
	var transform : Transform2D = Transform2D(0, position)
	RenderingServer.canvas_item_set_transform(canvas_item_rid, transform)
	PhysicsServer2D.area_set_transform(area, transform)
	PhysicsServer2D.area_set_param(area, PhysicsServer2D.AREA_PARAM_PRIORITY, 1)
	
	var space_state : PhysicsDirectSpaceState2D = parent_canvas_item.get_world_2d().direct_space_state
	var params : PhysicsShapeQueryParameters2D = PhysicsShapeQueryParameters2D.new()
	
	params.shape_rid = PhysicsServer2D.area_get_shape(area, 0)
	params.transform = PhysicsServer2D.area_get_transform(area)
	params.collide_with_areas = true
	params.collide_with_bodies = false
	params.collision_mask = PhysicsServer2D.area_get_collision_mask(area)
	
	var results = space_state.intersect_shape(params)
	for result in results:
		var area_rid : RID = result.rid
		hits.append(area_rid)
		#for effect in effects:
			#EffectServer.receive_effect(area_rid, effect, {})
		#callback_func.call(self)
		
	#if add_lifetime_counter(delta):
		#callback_func.call(self)
		#destroy_projectile()
		pass

func hit():
	for hit in hits:
		for effect in effects:
			EffectServer.receive_effect(hit, effect, {})
	hits.clear()
	pass

func draw_melee():
	RenderingServer.canvas_item_add_texture_rect(self.canvas_item_rid, Rect2(0, 0, self.texture.get_width(), self.texture.get_height()), self.texture)
	var transform : Transform2D = Transform2D(0, position) 
	RenderingServer.canvas_item_set_transform(canvas_item_rid, transform)
	pass

func destroy_melee():
	PhysicsServer2D.free_rid(area)
	PhysicsServer2D.free_rid(shape)
	RenderingServer.free_rid(canvas_item_rid)
	pass

func _notification(what: int) -> void:
	if what == NOTIFICATION_PREDELETE:
		PhysicsServer2D.free_rid(area)
		PhysicsServer2D.free_rid(shape)
		RenderingServer.free_rid(canvas_item_rid)
