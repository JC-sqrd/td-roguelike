extends Node

var main_grid : GridData

signal placed_unit_on_tile(unit : Unit2D, tile_model : TileModel)
signal spawned_unit_on_tile(unit : Unit2D, tile_model : TileModel)

func place_unit_on_tile(tile_index : Vector2i, unit : Unit2D):
	pass


func place_unit_on_mouse_tile(mouse_pos : Vector2, unit : Unit2D):
	var grid_index : int = main_grid.grid_to_index(main_grid.world_to_grid(mouse_pos))
	print("Left Click Pressed: " + "Grid Index: " + str(grid_index) + " Mouse Pos: " + str(mouse_pos))
	var tile_model : TileModel = main_grid.get_tile_model_from_world(mouse_pos)
	if tile_model != null and !tile_model.occupied:
		unit.died.connect(_on_unit_died)
		main_grid.add_unit_on_tile(unit, tile_model)
		placed_unit_on_tile.emit(unit, tile_model)
	pass


func spawn_unit_on_mouse_tile(mouse_pos : Vector2, unit : Unit2D):
	var grid_index : int = main_grid.grid_to_index(main_grid.world_to_grid(mouse_pos))
	print("Left Click Pressed: " + "Grid Index: " + str(grid_index) + " Mouse Pos: " + str(mouse_pos))
	var tile_model : TileModel = main_grid.get_tile_model_from_world(mouse_pos)
	if tile_model != null:
		#main_grid.add_unit_on_tile(unit, tile_model)
		spawned_unit_on_tile.emit(unit, tile_model)
	pass

func spawn_unit_on_grid_tile(tile_index : Vector2i, unit : Unit2D):
	var index : int = main_grid.grid_to_index(tile_index)
	var tile_model : TileModel = main_grid.get_tile_model_from_grid(index)
	if tile_model != null:
		spawned_unit_on_tile.emit(unit, tile_model)
	pass

func _on_unit_died(unit : Unit2D):
	unit.died.disconnect(_on_unit_died)
	if main_grid.tiled_units.has(unit):
		main_grid.remove_unit_on_tile(unit, main_grid.tiled_units[unit])
	pass
