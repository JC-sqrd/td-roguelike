class_name RosterData extends RefCounted


var roster_size : int = 5
var roster : Dictionary[StringName,Array]


func add_unit_scene_data(unit_scene_data : UnitSceneData) -> bool:
	if !roster.has(unit_scene_data.unit_id):
		roster[unit_scene_data.unit_id] = [unit_scene_data]
	else:
		roster[unit_scene_data.unit_id].append(unit_scene_data) 
	return true

func get_unit_scene_data(unit_id : StringName, index : int) -> UnitSceneData:
	var scene_data : UnitSceneData = roster[unit_id][index]
	return scene_data
