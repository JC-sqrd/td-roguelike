class_name Tile extends Node2D


var tile_size : int = 64
var grid : Grid
var grid_position : Vector2 = Vector2(-1, -1)
var unit : Unit2D
var occupied : bool = false
@export var tile_sprite : Sprite2D


func _ready() -> void:
	pass

func initialize_grid_tile(grid : Grid):
	self.grid = grid
	pass


func scale_tile_sprite(tile_size : Vector2):
	if tile_sprite != null:
		var target_scale : Vector2 = Vector2(tile_size.x / tile_sprite.texture.get_width(), tile_size.y / tile_sprite.texture.get_height())
		tile_sprite.scale = target_scale
	pass

func place_unit(unit : Unit2D):
	occupied = true 
	add_child(unit)
	self.unit = unit
	unit.z_index = 1
	pass

func remove_unit() -> Unit2D:
	remove_child(unit)
	occupied = false
	var removed_unit = self.unit
	removed_unit.z_index = 0
	self.unit = null
	return removed_unit

func is_occupied() -> bool:
	return occupied

func set_grid_position(grid_pos : Vector2):
	grid_position = grid_pos
	pass
