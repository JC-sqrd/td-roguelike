class_name UnitDataTemplate extends Resource


@export var stats_template : StatsTemplate
@export var unit_tile_size : Vector2i = Vector2i(1,1)


func build_unit_data() -> UnitData:
	return UnitData.new(stats_template.build_stats_from_template(), unit_tile_size)
