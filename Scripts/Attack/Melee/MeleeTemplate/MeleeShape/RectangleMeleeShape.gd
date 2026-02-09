class_name RectangleMeleeShape extends MeleeShape

@export var length : float = 128
@export var width : float = 128

func get_shape() -> RID:
	return PhysicsServer2D.rectangle_shape_create()

func get_shape_data() -> Variant:
	return Vector2(width / 2, length / 2)
