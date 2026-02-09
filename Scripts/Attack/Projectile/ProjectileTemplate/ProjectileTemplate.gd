class_name ProjectileTemplate extends Resource

@export var shape : ProjectileShape
@export var texture : Texture2D

@export var spawn_position : Vector2 = Vector2(0,0)
@export var direction : Vector2 = Vector2(1,0)
@export var speed : float = 100
@export var lifetime : float = 5
@export var collision_layer : int = 0
@export var collision_mask : int = 0

func build_projectile(parent_canvas_item : CanvasItem) -> Projectile:
	var params : CreateProjectileParams = CreateProjectileParams.new()
	params.shape = shape.get_shape()
	params.shape_data = shape.get_shape_data()
	params.texture = texture
	params.direction = direction
	params.lifetime = lifetime
	params.speed = speed
	params.canvas_item = parent_canvas_item
	params.collision_layer = collision_layer
	params.collision_layer = collision_mask
	params.position = spawn_position
	return Projectile.create_projectile(params)
