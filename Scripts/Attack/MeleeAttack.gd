class_name MeleeAttack extends Attack

@export var melee_template : MeleeTemplate
@export var melee : Melee
@export var pierce : bool = false
var _frame_counter : int = 0

@export var anim_fps : int = 12
@export var anim_frames : int = 0
@export var action_frame : int = 0



@export var anim_step : float = 0
@export var active_frames : Array[int]
var step_counter : float = 0
var current_frame : int = 0
var second : float = 0



var active : bool = false

func _ready() -> void:
	super()
	print("MELEE ATTACK READY")
	melee.area_entered.connect(_on_melee_area_entered)
	melee.area_exited.connect(_on_melee_area_exited)
	attack_timer.timeout.connect(_on_attack_timer_timeout)


func initialize(actor : Unit2D):
	super(actor)
	melee.effects = self.effects

	pass

func start_attack():
	melee.context = attack_context
	active = true
	melee.hit_collisions(pierce)
	end_attack()
	pass


func end_attack():
	active = false
	if melee.collisions.size() > 0:
		attack_timer.start(1 / attack_speed_stat.get_value())
	pass

func _on_melee_area_entered(area : Area2D):
	attack_timer.start(1 / attack_speed_stat.get_value())
	pass

func _on_melee_area_exited(area : Area2D):
	if melee.collisions.size() <= 0:
		end_attack()
		attack_timer.stop()
	pass

func _on_attack_timer_timeout():
	attack_timer.stop()
	start_attack()
	pass

func melee_callback():
	pass
