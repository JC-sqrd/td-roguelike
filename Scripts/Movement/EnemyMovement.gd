class_name EnemyMovement extends UnitMovement


func _ready() -> void:
	direction = Vector2(-1, 0)

func _physics_process(delta: float) -> void:
	if !active:
		return
		
	velocity = Vector2(direction.x * speed * delta, direction.y * speed * delta)
	unit.position += velocity
	pass
