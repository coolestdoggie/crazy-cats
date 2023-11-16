extends State

@export var levels: Array[PackedScene]


func enter(_msg := {}) -> void:
	remove_previous_level()	
	load_current_level()
	state_machine.transition_to("PlanningState")


func remove_previous_level() -> void:
	if LevelDataService.current_level_instance:
		LevelDataService.current_level_instance.queue_free()


func load_current_level() -> void:
	LevelDataService.current_level_instance = levels[LevelDataService.current_level_index].instantiate()
	get_tree().root.get_child(0).add_child(LevelDataService.current_level_instance)
