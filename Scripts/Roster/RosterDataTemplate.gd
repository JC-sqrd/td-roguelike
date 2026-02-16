class_name RosterDataTemplate extends Resource

@export var unit_scene_data : Array[UnitSceneData]



func build_roster() -> RosterData:
	var roster_data : RosterData = RosterData.new()
	for scene_data in unit_scene_data:
		roster_data.add_unit_scene_data(scene_data)
		pass
	return roster_data
