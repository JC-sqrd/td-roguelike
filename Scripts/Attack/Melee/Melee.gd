class_name Melee extends RefCounted

var parent_canvas_item : CanvasItem
var canvas_item_rid : RID
var body : RID
var shape : RID
var texture : Texture2D

var position : Vector2 = Vector2(0,0)
var direction : Vector2 = Vector2(0,0)
var lifetime : float = 0.1
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
