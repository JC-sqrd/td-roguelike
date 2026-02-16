extends Node

enum GameState {IDLE, BATTLE}
var current_game_state : GameState
const GLOBAL_TILE_SIZE : Vector2i = Vector2i(128, 128)



func _ready() -> void:
	current_game_state = GameState.IDLE

func set_current_game_state(game_state : GameState):
	current_game_state = game_state
	pass
