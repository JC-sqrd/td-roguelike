class_name UnitBuilder extends Node2D

var bodies : Array[RID]
var body : RID
var canvas_item : RID
var texture :Texture2D = preload("uid://bmfa1k5yfxtqe")
var pos : Vector2 = Vector2(0,100)
var speed : float = 100


func _ready():
	build_unit_from_data()
	pass

func build_unit_from_data():
	body = PhysicsServer2D.body_create()
	PhysicsServer2D.body_set_mode(body, PhysicsServer2D.BODY_MODE_KINEMATIC)
	
	var shape : RID = PhysicsServer2D.circle_shape_create()
	PhysicsServer2D.shape_set_data(shape, 32)
	PhysicsServer2D.body_add_shape(body, shape)
	
	PhysicsServer2D.body_set_space(body, get_world_2d().space)
	
	canvas_item = RenderingServer.canvas_item_create()
	RenderingServer.canvas_item_set_parent(canvas_item, get_canvas_item())
	
	var tex_rid : RID = texture.get_rid()
	var rect : Rect2 = Rect2(0, 0, 128, 128)
	RenderingServer.canvas_item_add_texture_rect(canvas_item, rect, tex_rid)
	pass

func _physics_process(delta: float) -> void:
	pos.x += speed * delta
	var xForm : Transform2D = Transform2D(0, pos)
	PhysicsServer2D.body_set_state(body, PhysicsServer2D.BODY_STATE_TRANSFORM, xForm)
	RenderingServer.canvas_item_set_transform(canvas_item, xForm)
	pass

func _exit_tree() -> void:
	PhysicsServer2D.free_rid(body)
	RenderingServer.free_rid(canvas_item)
