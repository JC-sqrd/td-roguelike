extends Entity


@export var movement : UnitMovement


func initialize(rid : RID):
	entity_rid = rid
	stats.initialize()
	context = {"stats" : stats, "actor" : self}
	
	attack.initialize(self)
	
	var effect_listener : EffectListener = EffectListener.new(stats)
	
	#Register effect listener to effect server
	EffectServer.register_effect_listener(entity_rid, effect_listener)
	
	#Initialize health manager
	health_manager = HealthManager.new(stats.get_stat("max_health"), stats.get_stat("current_health"))
	health_manager.health_depleted.connect(_on_health_depleted)
	
	movement.initialize(self)
