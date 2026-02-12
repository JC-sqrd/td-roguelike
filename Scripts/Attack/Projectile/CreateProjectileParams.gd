class_name CreateProjectileParams extends RefCounted

var owner : Variant
var lifetime : float = 0
var position : Vector2 = Vector2(0,0)
var texture : Texture2D
var speed : float = 0 
var direction : Vector2 = Vector2(1,0)
var shape : RID
var shape_data : Variant
var canvas_item : CanvasItem
var collision_layer : int = 1
var collision_mask : int = 1
