extends State

@export var levels: Array[PackedScene]

var current_level := 0
var level_instance

func enter(_msg := {}) -> void:
	if level_instance:
		level_instance.queue_free()
	
	level_instance = levels[0].instantiate()
	get_tree().root.get_child(0).add_child(level_instance)
	state_machine.transition_to("PlanningState")
