class_name Scanner2D extends Node

@export var ray_casts : Array[RayCast2D]

var collision_detected : bool = false
var collision : bool = false
var was_colliding : bool = false

signal collision_enter()
signal collision_exit()

func _physics_process(delta: float) -> void:
	for ray_cast : RayCast2D in ray_casts:
		var is_colliding_current : bool = ray_cast.is_colliding()
		
		if is_colliding_current and not was_colliding:
			was_colliding = true
			collision = true
			collision_enter.emit()
			return
		elif not is_colliding_current and was_colliding:
			was_colliding = false
			collision = false
			collision_exit.emit()
		pass
