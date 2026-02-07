class_name GridController extends Node

var grid_data : GridData
var grid_view : Grid

var active : bool = false

func initialize(grid_data : GridData, grid_view : Grid):
	self.grid_data = grid_data
	self.grid_view = grid_view
	active = true
	pass

const PREFAB_BASE_UNIT = preload("uid://wk226ka6adsl")
const PREFAB_BASE_ENEMY = preload("uid://cjmpcvq57n4k6")


func _unhandled_input(event: InputEvent) -> void:
	if !active : 
		return
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MouseButton.MOUSE_BUTTON_LEFT:
			var mouse_pos : Vector2 = grid_view.get_global_mouse_position()
			GridServer.place_unit_on_mouse_tile(mouse_pos, PREFAB_BASE_UNIT.instantiate() as Unit2D)
		elif event.pressed and event.button_index == MouseButton.MOUSE_BUTTON_RIGHT:
			var mouse_pos : Vector2 = grid_view.get_global_mouse_position()
			GridServer.spawn_unit_on_mouse_tile(mouse_pos, PREFAB_BASE_ENEMY.instantiate() as Unit2D)
			pass
		pass
	pass
