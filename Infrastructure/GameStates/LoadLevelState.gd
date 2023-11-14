extends State

@export var levels: Array[PackedScene]

var current_level := 0
var level_instance
var draggable_objects

func enter(_msg := {}) -> void:
	remove_previous_leve()	
	load_current_level()
	state_machine.transition_to("PlanningState")


func remove_previous_leve() -> void:
	if level_instance:
		level_instance.queue_free()


func load_current_level() -> void:
	level_instance = levels[current_level].instantiate()
	get_tree().root.get_child(0).add_child(level_instance)