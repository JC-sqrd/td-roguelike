class_name GridController extends Node

var grid_data : GridData
var grid_view : Grid

var active : bool = false

const RANGE_UNIT = preload("uid://wk226ka6adsl")

const PREFAB_BASE_ENEMY = preload("uid://cjmpcvq57n4k6")
const MELEE_UNIT = preload("uid://2hunufhpa86t")

func initialize(grid_data : GridData, grid_view : Grid):
	self.grid_data = grid_data
	self.grid_view = grid_view
	active = true
	pass


func _unhandled_input(event: InputEvent) -> void:
	if !active : 
		return
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MouseButton.MOUSE_BUTTON_LEFT:
			var mouse_pos : Vector2 = grid_view.get_global_mouse_position()
			var unit : Unit = RANGE_UNIT.instantiate() as Unit
			print("UNIT TO PLACE: " + str(unit))
			GridServer.place_unit_on_mouse_tile(mouse_pos, unit)
		elif event.pressed and event.button_index == MouseButton.MOUSE_BUTTON_RIGHT:
			var mouse_pos : Vector2 = grid_view.get_global_mouse_position()
			#for i in range(100):
			#	GridServer.spawn_unit_on_mouse_tile(mouse_pos, PREFAB_BASE_ENEMY.instantiate() as Entity)
			#	pass
			GridServer.spawn_unit_on_mouse_tile(mouse_pos, PREFAB_BASE_ENEMY.instantiate() as Unit)
			pass
		pass
	pass
