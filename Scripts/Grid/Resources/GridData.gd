class_name GridData extends RefCounted


@export var grid_x_size : int = 10
@export var grid_y_size : int = 10

var tile_size : Vector2i = Vector2i(128,128)
var grid_rect : Rect2i

var grid : Array[TileModel]

var tiled_units : Dictionary[Unit2D, TileModel]

func add_unit_on_tile(unit : Unit2D, tile_model : TileModel) -> bool:
	if !tile_model.occupied:
		tile_model.occupied = true
		tiled_units[unit] = tile_model
		return true
	return false

func remove_unit_on_tile(unit : Unit2D, tile_model : TileModel) -> bool:
	if tiled_units.has(unit):
		tiled_units.erase(unit)
		tile_model.occupied = false
		return true
	return false

func world_to_grid(world_pos : Vector2) -> Vector2i:
	var map_pos : Vector2i = Vector2i(floor(world_pos.x / tile_size.x), floor(world_pos.y / tile_size.y)) 
	return map_pos - grid_rect.position

func grid_to_index(grid_pos : Vector2i) -> int:
	if grid_pos.x < 0 or grid_pos.x >= grid_rect.size.x or grid_pos.y < 0 or grid_pos.y >= grid_rect.size.y:
		return -1
	return grid_pos.x + (grid_pos.y * grid_rect.size.x)

func get_tile_model_from_grid(index : int) -> TileModel:
	if index != -1:
		return grid[index]
	return null

func get_tile_model_from_world(world_pos : Vector2) -> TileModel:
	var map_pos : Vector2i = world_to_grid(world_pos)
	var index : int = grid_to_index(map_pos)
	
	if index != -1:
		return grid[index]
	return null
