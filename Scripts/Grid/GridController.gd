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
			var grid_index : int = grid_data.grid_to_index(grid_data.world_to_grid(mouse_pos))
			print("Left Click Pressed: " + "Grid Index: " + str(grid_index) + " Mouse Pos: " + str(mouse_pos))
			var tile_model : TileModel = grid_data.get_tile_model_from_world(mouse_pos)
			if tile_model != null and !tile_model.occupied:
				var unit : Unit2D = PREFAB_BASE_UNIT.instantiate() as Unit2D
				unit.global_position = tile_model.tile_global_pos
				tile_model.occupied = true
				grid_view.add_child(unit)
				unit.scale_tile_sprite(grid_data.tile_size)
		elif event.pressed and event.button_index == MouseButton.MOUSE_BUTTON_RIGHT:
			var mouse_pos : Vector2 = grid_view.get_global_mouse_position()
			var grid_index : int = grid_data.grid_to_index(grid_data.world_to_grid(mouse_pos))
			print("Right Click Pressed: " + "Grid Index: " + str(grid_index) + " Mouse Pos: " + str(mouse_pos))
			var tile_model : TileModel = grid_data.get_tile_model_from_world(mouse_pos)
			if tile_model != null and !tile_model.occupied:
				var enemy : Unit2D = PREFAB_BASE_ENEMY.instantiate() as Unit2D
				enemy.global_position = tile_model.tile_global_pos
				tile_model.occupied = true
				grid_view.add_child(enemy)
				enemy.scale_tile_sprite(grid_data.tile_size)
			pass
		pass
	pass
