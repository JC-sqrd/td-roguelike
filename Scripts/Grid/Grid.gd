class_name Grid extends Node2D

@export var grid_x_size : int = 10
@export var grid_y_size : int = 10

var grid : Array[Array]

const tile_size : int = 128

const TILE = preload("uid://cdilib0ifiu2c")
const UNIT_TEST = preload("uid://wk226ka6adsl")


func _ready() -> void:
	#print("World position of grid position (1,1): " + str(grid_to_world(1,1)))
	generate_world_grid()
	var unit : Unit2D = UNIT_TEST.instantiate()
	var unit2 : Unit2D = UNIT_TEST.instantiate()
	var unit3 : Unit2D = UNIT_TEST.instantiate()
	var unit4 : Unit2D = UNIT_TEST.instantiate()
	var unit5 : Unit2D = UNIT_TEST.instantiate()
	
	place_unit_on_tile(unit, Vector2i(0,1))
	place_unit_on_tile(unit2, Vector2i(0,2))
	place_unit_on_tile(unit3, Vector2i(0,3))
	place_unit_on_tile(unit4, Vector2i(0,4))
	place_unit_on_tile(unit5, Vector2i(9,0))

	pass

func generate_world_grid():
	for x in range(grid_x_size):
		var row : Array[Tile]
		for y in range(grid_y_size):
			var world_pos : Vector2 = grid_to_world(x, y)
			#print("World position of grid position "+ str(x) +", " + str(y) + ": " + str(world_pos) )
			#print("GRID X: " + str(x) + " GRID Y: " + str(y))
			var tile : Tile = TILE.instantiate() as Tile
			add_child(tile)
			row.append(tile)
			tile.scale_tile_sprite(Vector2(tile_size, tile_size))
			tile.set_grid_position(Vector2(x,y))
			tile.initialize_grid_tile(self)
			tile.global_position = world_pos 
			pass
		grid.append(row)
		pass
	
	print(can_place([Vector2i(0,0), Vector2i(0,1), Vector2i(0,2)], Vector2i(1,0)))
	pass

func can_place(offsets : Array[Vector2i], tile_index : Vector2i) -> bool:
	
	var target_offsets : Array[Vector2i]
	
	for offset in offsets:
		target_offsets.append(tile_index + offset) 
		pass
	
	for target_offset in target_offsets:
		
		var offset_tile : Tile = get_tile(target_offset)
		
		if offset_tile == null or offset_tile.is_occupied():
			return false
	return true

func place_unit_on_tile(unit : Unit2D, tile_index : Vector2i) -> bool:
	
	var tile : Tile = get_tile(tile_index)
	if !tile.is_occupied():
		tile.place_unit(unit)
		print("Unit successfully placed")
		return true
		
	print("Unit failed to place")
	
	return false

func remove_unit_from_tile(tile_index : Vector2i) -> Unit2D:
	var tile : Tile = get_tile(tile_index)
	if tile.is_occupied():
		return tile.remove_unit()
	return null

func get_tile(tile_index : Vector2i) -> Tile:
	if tile_index.x < 0 or tile_index.y < 0:
		return null
	else:
		return grid[tile_index.x][tile_index.y] as Tile

func grid_to_world(grid_x : int, grid_y : int) -> Vector2:
	var world_pos : Vector2 = Vector2(grid_x * tile_size, grid_y * tile_size) + Vector2(tile_size / 2, tile_size / 2)
	return world_pos
