class_name GridController extends Node

var grid_data : GridData
var grid_view : Grid

var active : bool = false

const UNIT_TEST = preload("uid://wk226ka6adsl")
const DATA_TEST_UNIT = preload("uid://bfi7psdyj32ew")

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
			var grid_index : int = grid_data.grid_to_index(grid_data.world_to_grid(mouse_pos))
			print("Left Click Pressed: " + "Grid Index: " + str(grid_index) + " Mouse Pos: " + str(mouse_pos))
			var tile_model : TileModel = grid_data.get_tile_model_from_world(mouse_pos)
			if tile_model != null and !tile_model.occupied:
				var unit : Unit2D = DATA_TEST_UNIT.build_unit_from_data()#UNIT_TEST.instantiate() as Unit2D
				unit.scale_tile_sprite(Vector2(grid_data.tile_size, grid_data.tile_size))
				unit.global_position = tile_model.tile_global_pos
				tile_model.occupied = true
				grid_view.add_child(unit)
			
	pass
