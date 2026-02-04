class_name UnitData extends Resource


@export var stats_template : StatsTemplate
@export var unit_tile_size : int = 1
@export var unit_texture : Texture

const PREFAB_BASE_UNIT = preload("uid://wk226ka6adsl")


func build_unit_from_data() -> Unit2D:
	var unit : Unit2D = PREFAB_BASE_UNIT.instantiate() as Unit2D
	unit.stats = stats_template.build_stats_from_template()
	unit.unit_tile_size = unit_tile_size
	#unit._stats = stats
	return unit
