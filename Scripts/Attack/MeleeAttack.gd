class_name MeleeAttack extends Attack


func initialize(actor : Unit2D):
	super(actor)
	pass

func start_attack():
	pass

func end_attack():
	pass

func _on_scanner_collision_enter():
	attack_timer.start(attack_speed_stat.get_value())
	pass

func _on_scanner_collision_exit():
	attack_timer.stop()
	pass

func _on_attack_timer_timeout():
	pass
