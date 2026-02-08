class_name Grid extends TileMapLayer

@export var grid_controller : GridController

var grid_data : GridData

const tile_size : Vector2i = GameManager.GLOBAL_TILE_SIZE

func _ready() -> void:
	
	pass

func initialize():
	grid_data = generate_model_from_tile_map(self)
	
	GridServer.main_grid = grid_data
	GridServer.placed_unit_on_tile.connect(_on_unit_placed_on_tile_model)
	GridServer.spawned_unit_on_tile.connect(_on_unit_spawned_on_tile_model)
	
	if grid_controller != null:
		grid_controller.initialize(grid_data, self)
		pass
	
	pass

func generate_model_from_tile_map(tile_map_layer : TileMapLayer) -> GridData:
	var used_rect : Rect2i = tile_map_layer.get_used_rect()
	var used_cells : Array[Vector2i] = tile_map_layer.get_used_cells()
	
	var grid_data : GridData = GridData.new()

	grid_data.grid_rect = used_rect
	grid_data.tile_size = tile_size
	
	var grid : Array[TileModel] = []
	grid.resize(used_rect.size.x * used_rect.size.y)
	
	var columns : int = 0
	var rows : int = 0
	
	for x in range(used_rect.size.x):
		for y in range(used_rect.size.y):
			var coords : Vector2i = Vector2i(x + used_rect.position.x,y + used_rect.position.y)
			var tile_data : TileData = tile_map_layer.get_cell_tile_data(coords)
			var tile_global_pos : Vector2 = tile_map_layer.map_to_local(coords)
			
			if tile_data:
				var tile_model : TileModel = TileModel.new()
				tile_model.tile_index = Vector2i(x,y)
				tile_model.tile_data = tile_data
				tile_model.tile_global_pos = tile_global_pos
				grid[x + (y * used_rect.size.x)] = tile_model
			else:
				grid[x + (y * used_rect.size.x)] = null
			pass
		pass
		
	grid_data.grid_x_size = used_rect.size.x
	grid_data.grid_y_size = used_rect.size.y
	grid_data.tile_size = tile_size
	grid_data.grid = grid
	return grid_data


func _on_unit_placed_on_tile_model(unit : Unit2D, tile_model : TileModel):
	print("PLACED UNIT ON TILE " + str(tile_model.tile_index))
	unit.global_position = tile_model.tile_global_pos
	add_child(unit)
	unit.scale_tile_sprite(grid_data.tile_size)
	pass

func _on_unit_spawned_on_tile_model(unit : Unit2D, tile_model : TileModel):
	print("SPAWNED UNIT ON TILE " + str(tile_model.tile_index))
	unit.global_position = tile_model.tile_global_pos
	add_child(unit)
	unit.scale_tile_sprite(grid_data.tile_size)
	pass
