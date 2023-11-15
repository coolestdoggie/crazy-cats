extends Node

var current_level_index := 0
var all_levels_data : AllLevelsData

func _ready() -> void:
	all_levels_data = load("res://StaticData/Data/Levels/AllLevelsData.tres") as AllLevelsData


func get_data_for_level(index: int) -> void:
	pass