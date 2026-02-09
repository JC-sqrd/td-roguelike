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
	melee = melee_template.build_melee(canvas_item)
	melee.position = actor.global_position
	melee.effects = effects
	#ms_per_frame = (anim_frames / anim_fps) / anim_fps
	
	#start_attack()
	pass

func start_attack():
	active = true
	current_frame += 1
	print("MELEE ATTACK ACTIVATED")
	pass

func _process(delta: float) -> void:
	#if !active:
		#return
	#
	#second += delta
	#step_counter += minf(delta, anim_step)
	#
	##print(delta)
	##print(ms_per_frame)
	#
	#if step_counter >= anim_step:
		#current_frame += 1
		#step_counter = 0
	#
	#print(current_frame)
	#
	#if current_frame == anim_frames:
		#active = false
		#print("SECOND ELAPSED: " + str(second))
		#current_frame = 0
	#
	#if second >= 1:
		#active = false
		#second = 0
	pass

func _physics_process(delta: float) -> void:
	if !active:
		return
	
	second += delta
	step_counter += minf(delta, anim_step)
	
	#print(delta)
	#print(ms_per_frame)
	
	if step_counter >= anim_step:
		current_frame += 1
		step_counter = 0
	
	print(current_frame)
	
	if active_frames.has(current_frame):
		melee.simulate_attack(delta, melee_callback)
		pass
	
	if current_frame == anim_frames:
		active = false
		melee.hit()
		attack_timer.start(attack_rate_stat.get_value())
		print("SECOND ELAPSED: " + str(second))
		current_frame = 0
	
	if second >= 1:
		active = false
		second = 0
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
