class_name Melee extends Area2D



var collisions : Array[RID]
var effects : Array[Effect]
var context : Dictionary

func _ready() -> void:
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)
	pass


func _on_area_entered(area : Area2D):
	print("Melee Area Entered")
	collisions.append(area.get_rid())
	pass


func _on_area_exited(area : Area2D):
	print("Melee Area Exited")
	collisions.erase(area.get_rid())
	pass

func hit_collisions(pierce : bool = true):
	if pierce:
		for collision in collisions:
			for effect in effects:
				EffectServer.receive_effect(collision, effect, context)
		pass
	else:
		for collision in collisions:
			for effect in effects:
				EffectServer.receive_effect(collision, effect, context)
			break
	pass
