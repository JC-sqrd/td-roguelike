class_name UnitData extends Resource


@export var stats : Stats

const PREFAB_BASE_UNIT = preload("uid://wk226ka6adsl")


func build_unit_from_data() -> Unit2D:
	var unit : Unit2D = PREFAB_BASE_UNIT.instantiate() as Unit2D
	unit._stats = stats
	return unit
