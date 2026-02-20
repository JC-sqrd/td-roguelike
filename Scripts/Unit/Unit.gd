class_name Unit extends Area2D

@export var entity : Entity

@export var unit_movement : UnitMovement
@export var unit_size_offsets : Array[Vector2i]

func _ready() -> void:
	entity.initialize(self, get_rid())
	
	entity.health_manager.health_depleted.connect(_on_health_depleted)
	
	EntityServer.register_entity(self, entity)
	
	unit_movement.initialize(self)
	pass

func _on_health_depleted():
	queue_free()
	pass
