extends Node2D

var current_level_index := 0
var current_level_instance
var all_levels_data : AllLevelsData

func _ready() -> void:
	all_levels_data = load("res://StaticData/Data/Levels/AllLevelsData.tres") as AllLevelsData


func get_data_for_current_level() -> LevelData:
	return get_data_for_level(current_level_index)


func get_data_for_level(index: int) -> LevelData:
	return all_levels_data.levels_data[index]


func set_next_level():
	current_level_index = clamp(current_level_index + 1, 0, all_levels_data.levels_data.size() - 1)

