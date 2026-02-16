class_name UnitCardUI extends CardUI

@export var unit_id : StringName
@onready var unit_name_label: Label = %UnitNameLabel

var unit_scene : PackedScene

func _ready() -> void:
	var scene_data : UnitSceneData = SceneServer.get_unit_scene_data(unit_id)
	if scene_data != null:
		unit_name_label.text = scene_data.unit_id
		pass
	pass
