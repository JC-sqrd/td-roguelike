extends Node


static var unit_scenes : Dictionary[StringName,UnitSceneData] = {
	preload("uid://cefkv7o6pgdl1").unit_id : preload("uid://cefkv7o6pgdl1"),
	preload("uid://s1xqr0wn68op").unit_id : preload("uid://s1xqr0wn68op")
}

static var enemy_scenes : Dictionary[StringName,UnitSceneData] = {
	preload("uid://dwr4wix6uu3ky").unit_id : preload("uid://dwr4wix6uu3ky")
}

static func instantiate_unit(unit_id : StringName) -> Unit2D:
	var unit : Unit2D = unit_scenes[unit_id].unit_scene.instantiate() as Unit2D
	return unit

static func get_unit_scene(unit_id : StringName) -> PackedScene:
	if !unit_scenes.keys().has(unit_id):
		return null
	var scene : PackedScene = unit_scenes[unit_id].unit_scene
	if scene != null:
		return scene
	return null

static func get_unit_scene_data(unit_id : StringName) -> UnitSceneData:
	if !unit_scenes.keys().has(unit_id):
		return null
	var scene_data : UnitSceneData = unit_scenes[unit_id]
	if scene_data != null:
		return scene_data
	return null
