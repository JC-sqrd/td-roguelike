class_name Projectile extends RefCounted

var canvas_item : CanvasItem
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

func _init(body : RID, shape : RID,canvas_item_rid : RID, canvas_item : CanvasItem, texture : Texture2D, speed : float = 0):
	self.body = body
	self.canvas_item_rid = canvas_item_rid
	self.canvas_item = canvas_item
	self.shape = shape
	self.texture = texture
	self.speed = speed
	
	PhysicsServer2D.body_add_shape(self.body, self.shape)
	
	RenderingServer.canvas_item_set_parent(canvas_item_rid, canvas_item.get_canvas())
	RenderingServer.canvas_item_add_texture_rect(self.canvas_item_rid, Rect2(self.position.x, self.position.y, self.texture.get_width(), self.texture.get_height()), self.texture)
	pass

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

func set_body_mode(mode : PhysicsServer2D.BodyMode) -> Projectile:
	PhysicsServer2D.body_set_mode(self.body, mode)
	return self

func set_body_space(space : RID) -> Projectile:
	PhysicsServer2D.body_set_space(self.body, space)
	return self

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
