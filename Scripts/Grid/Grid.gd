class_name Grid extends TileMapLayer

@export var grid_x_size : int = 10
@export var grid_y_size : int = 10

#var grid : Array[Array]
@export var grid_data : GridData


const tile_size : int = 128

const TILE = preload("uid://cdilib0ifiu2c")
const UNIT_TEST = preload("uid://wk226ka6adsl")


func _ready() -> void:
	print(get_used_cells())
	print(get_used_rect().position)
	generate_model_from_tile_map(self)
	pass


func generate_model_from_tile_map(tile_map_layer : TileMapLayer) -> GridData:
	var used_rect : Rect2i = tile_map_layer.get_used_rect()
	var used_cells : Array[Vector2i] = tile_map_layer.get_used_cells()
	
	var grid_data : GridData = GridData.new()

	var grid : Array[TileModel] = []
	grid.resize(used_rect.size.x * used_rect.size.y)
	
	
	for x in range(used_rect.size.x):
		for y in range(used_rect.size.y):
			var tile_data : TileData = tile_map_layer.get_cell_tile_data(Vector2i(x + used_rect.position.x,y + used_rect.position.y))
			
			if tile_data:
				var tile_model : TileModel = TileModel.new()
				tile_model.tile_data = tile_data
				grid[x + (y * used_rect.size.x)] = tile_model
			else:
				grid[x + (y * used_rect.size.x)] = null
			pass
		pass
	grid_data.grid = grid
	print(grid)
	return grid_data
