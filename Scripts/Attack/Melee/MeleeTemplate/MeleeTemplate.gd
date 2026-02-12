class_name MeleeTemplate extends Resource

@export var shape : MeleeShape
@export var texture : Texture2D

@export var position : Vector2 = Vector2(0,0)
@export var direction : Vector2 = Vector2(1,0)
@export var active_frames : int = 3
@export var collision_layer : int = 0
@export var collision_mask : int = 0

func build_melee(parent_canvas_item : CanvasItem) -> Melee:
	var params : CreateMeleeParams = CreateMeleeParams.new()
	params.shape = shape.get_shape()
	params.shape_data = shape.get_shape_data()
	params.texture = texture
	params.direction = direction
	params.active_frames = active_frames
	params.canvas_item = parent_canvas_item
	params.collision_layer = collision_layer
	params.collision_mask = collision_mask
	params.position = position
	return null
