class_name Scanner2D extends Node

@export var ray_casts : Array[RayCast2D]

var collision_detected : bool = false

func _physics_process(delta: float) -> void:
	for ray_cast : RayCast2D in ray_casts:
		if ray_cast.is_colliding() and ray_cast.get_collider() is Unit2D:
			collision_detected = true
		else:
			collision_detected = false
		pass
