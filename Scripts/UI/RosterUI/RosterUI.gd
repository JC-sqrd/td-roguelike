class_name RosterUI extends Control


const UI_UNIT_CARD = preload("uid://buudt686rilxs")
@onready var unit_card_container: HBoxContainer = %UnitCardContainer



func add_unit_scene_data_ui(unit_scene_data : UnitSceneData):
	var unit_card : UnitCardUI = UI_UNIT_CARD.instantiate() as UnitCardUI
	unit_card_container.add_child(unit_card)
	unit_card.unit_name_label.text = unit_scene_data.unit_id
	pass
