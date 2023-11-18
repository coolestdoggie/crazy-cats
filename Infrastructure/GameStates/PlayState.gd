extends State

var finisher : Finisher

func enter(_msg := {}) -> void:
	PhysicsServer2D.set_active(true)

	for c in get_all_children(LevelDataService.current_level_instance):
		if c.has_method("start_acting"):
			c.start_acting()
		if c.has_signal("ate_food"):
			finisher = c
			(c as Finisher).ate_food.connect(on_finisher_ate_food)


func get_all_children(in_node,arr:=[]):
	arr.push_back(in_node)
	for child in in_node.get_children():
		arr = get_all_children(child,arr)
	return arr


func on_finisher_ate_food():
	state_machine.transition_to("FinishState")


func exit() -> void:
	finisher.ate_food.disconnect(on_finisher_ate_food)
