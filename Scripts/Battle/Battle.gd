class_name Battle extends Node2D

@export var grid : Grid

@export var roster_controller : RosterController


@onready var battle_ui_layout_scene : PackedScene = preload("uid://dd5xvucuhjp6s")

func _ready() -> void:
	assert(grid != null, "Grid does not exist for Battle")
	grid.initialize()
	start_battle()
	pass

func start_battle():
	var battle_ui : BattleUI = battle_ui_layout_scene.instantiate() as BattleUI
	
	GameManager.set_current_game_state(GameManager.GameState.BATTLE)
	GameCanvasLayer.set_main_ui_layout(battle_ui)
	
	roster_controller.set_roster_ui(battle_ui.ui_roster)
	roster_controller.initialize()
	
	
	pass
