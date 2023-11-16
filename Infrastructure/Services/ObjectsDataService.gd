extends Node

@export var draggable_objects : DraggableObjectsData


func _ready() -> void:
	draggable_objects = load("res://StaticData/Data/Draggables/Draggables.tres") as DraggableObjectsData
	print(draggable_objects)

func get_scene_by_id(id: String):
	return draggable_objects.objects[id]
