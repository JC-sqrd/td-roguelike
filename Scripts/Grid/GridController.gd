class_name GridController extends Node

var grid_data : GridData
var grid_view : Grid

var active : bool = false

func initialize(grid_data : GridData, grid_view : Grid):
	self.grid_data = grid_data
	self.grid_view = grid_view
	active = true
	
	#for i in range(grid_data.grid_y_size):
		#print("INDEX: " + str(i))
		#for j in range(200):
			##await get_tree().create_timer(0.1).timeout
			#GridServer.spawn_unit_on_grid_tile(Vector2i(8,i), PREFAB_BASE_ENEMY.instantiate() as Unit2D)
			#pass
		#pass
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
			#for i in range(100):
				#GridServer.spawn_unit_on_mouse_tile(mouse_pos, PREFAB_BASE_ENEMY.instantiate() as Unit2D)
				#pass
			GridServer.spawn_unit_on_mouse_tile(mouse_pos, PREFAB_BASE_ENEMY.instantiate() as Unit2D)
			pass
		pass
	pass
