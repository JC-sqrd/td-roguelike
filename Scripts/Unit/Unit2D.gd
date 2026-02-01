class_name Unit2D extends Node2D


@export var unit_tile_size : int = 1
@export var unit_sprite : Sprite2D

@export var offsets : Array[Vector2i] = [Vector2i(0,0)]  


func scale_tile_sprite(tile_size : Vector2):
	if unit_sprite != null:
		var target_scale : Vector2 = Vector2(tile_size.x / unit_sprite.texture.get_width(), tile_size.y / unit_sprite.texture.get_height())
		unit_sprite.scale = target_scale
	pass
