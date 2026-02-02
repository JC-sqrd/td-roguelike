class_name Grid extends TileMapLayer

@export var grid_controller : GridController

var grid_data : GridData

const tile_size : int = GameManager.GLOBAL_TILE_SIZE

func _ready() -> void:
	
	pass

func initialize():
	grid_data = generate_model_from_tile_map(self)
	
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
	
	
	for x in range(used_rect.size.x):
		for y in range(used_rect.size.y):
			var coords : Vector2i = Vector2i(x + used_rect.position.x,y + used_rect.position.y)
			var tile_data : TileData = tile_map_layer.get_cell_tile_data(coords)
			var tile_global_pos : Vector2 = tile_map_layer.map_to_local(coords)
			
			if tile_data:
				var tile_model : TileModel = TileModel.new()
				tile_model.tile_data = tile_data
				tile_model.tile_global_pos = tile_global_pos
				grid[x + (y * used_rect.size.x)] = tile_model
			else:
				grid[x + (y * used_rect.size.x)] = null
			pass
		pass
	grid_data.grid = grid
	print(grid)
	return grid_data
