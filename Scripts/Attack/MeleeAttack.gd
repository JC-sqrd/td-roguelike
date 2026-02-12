class_name MeleeAttack extends Attack

@export var melee_template : MeleeTemplate
var _frame_counter : int = 0

@export var anim_fps : int = 12
@export var anim_frames : int = 0
@export var action_frame : int = 0

@export var anim_step : float = 0
@export var active_frames : Array[int]
var step_counter : float = 0
var current_frame : int = 0
var second : float = 0

var melee : Melee

var active : bool = false

func _ready() -> void:
	super()
	scanner.collision_enter.connect(_on_scanner_collision_enter)
	scanner.collision_exit.connect(_on_scanner_collision_exit)
	attack_timer.timeout.connect(_on_attack_timer_timeout)

func initialize(actor : Unit2D):
	super(actor)
	pass

func start_attack():
	active = true
	pass

func _physics_process(delta: float) -> void:
	if !active:
		return
	pass

func end_attack():
	pass

func _on_scanner_collision_enter():
	attack_timer.start(attack_rate_stat.get_value())
	pass

func _on_scanner_collision_exit():
	active = false
	attack_timer.stop()
	pass

func _on_attack_timer_timeout():
	attack_timer.stop()
	start_attack()
	pass

func melee_callback():
	pass
