extends Node

var main_grid : GridData

signal placed_unit_on_tile(unit : Unit, tile_model : TileModel)
signal spawned_unit_on_tile(unit : Unit, tile_model : TileModel)

func place_unit_on_tile(tile_index : Vector2i, unit : Unit):
	pass


func place_unit_on_mouse_tile(mouse_pos : Vector2, unit : Unit):
	var grid_index : int = main_grid.grid_to_index(main_grid.world_to_grid(mouse_pos))
	print("Left Click Pressed: " + "Grid Index: " + str(grid_index) + " Mouse Pos: " + str(mouse_pos))
	
	var tile_model : TileModel = main_grid.get_tile_model_from_world(mouse_pos)
	var offset_tiles : Array[TileModel]
	
	for offset in unit.unit_size_offsets:
		var offset_coords : Vector2i = tile_model.tile_index + (offset * Vector2i.ONE)
		var offset_tile : TileModel = main_grid.get_tile_model_from_grid(main_grid.grid_to_index(offset_coords))
		
		if offset_tile == null or offset_tile.occupied:
			printerr("Invalid unit placement")
			return
		
		offset_tiles.append(offset_tile)
		pass
	
	if tile_model != null and !tile_model.occupied:
		unit.entity.died.connect(_on_unit_died)
		main_grid.add_unit_on_tile(unit, tile_model, offset_tiles)
		placed_unit_on_tile.emit(unit, tile_model)
	pass


func spawn_unit_on_mouse_tile(mouse_pos : Vector2, unit : Unit):
	var grid_index : int = main_grid.grid_to_index(main_grid.world_to_grid(mouse_pos))
	print("Left Click Pressed: " + "Grid Index: " + str(grid_index) + " Mouse Pos: " + str(mouse_pos))
	var tile_model : TileModel = main_grid.get_tile_model_from_world(mouse_pos)
	if tile_model != null:
		spawned_unit_on_tile.emit(unit, tile_model)
	pass

func spawn_unit_on_grid_tile(tile_index : Vector2i, unit : Entity):
	var index : int = main_grid.grid_to_index(tile_index)
	var tile_model : TileModel = main_grid.get_tile_model_from_grid(index)
	if tile_model != null:
		spawned_unit_on_tile.emit(unit, tile_model)
	pass

func _on_unit_died(unit : Unit):
	unit.entity.died.disconnect(_on_unit_died)
	if main_grid.tiled_units.has(unit):
		var offset_tiles : Array[TileModel]
		for offset in unit.unit_size_offsets:
			var offset_coords : Vector2i = main_grid.tiled_units[unit].tile_index + (offset * Vector2i.ONE)
			var offset_tile : TileModel = main_grid.get_tile_model_from_grid(main_grid.grid_to_index(offset_coords))
		
			offset_tiles.append(offset_tile)
		
		main_grid.remove_unit_on_tile(unit, main_grid.tiled_units[unit], offset_tiles)
	pass
