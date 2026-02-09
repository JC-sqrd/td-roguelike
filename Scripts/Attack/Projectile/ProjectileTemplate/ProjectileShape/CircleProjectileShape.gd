class_name CircleProjectileShape extends ProjectileShape


@export var radius : float = 10


func get_shape() -> RID:
	return PhysicsServer2D.circle_shape_create()

func get_shape_data() -> Variant:
	shape_data = radius
	return shape_data
