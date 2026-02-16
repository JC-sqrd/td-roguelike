class_name RosterController extends Node

@export var roster_data_template : RosterDataTemplate

var roster_data : RosterData
var roster_ui : RosterUI

func initialize():
	roster_data = roster_data_template.build_roster()
	
	if roster_ui != null:
		#print("DATA ARR: " + str(roster_data.roster))
		for arr_key in roster_data.roster:
			for data in roster_data.roster[arr_key]:
				print(data)
				roster_ui.add_unit_scene_data_ui(data)
			pass
		pass
	
	pass

func set_roster_ui(roster_ui : RosterUI):
	self.roster_ui = roster_ui
	pass
