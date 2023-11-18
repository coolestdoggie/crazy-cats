extends State

func enter(_msg := {}) -> void:
	PhysicsServer2D.set_active(true)

	for c in get_all_children(LevelDataService.current_level_instance):
		if c.has_method("start_acting"):
			c.start_acting()

func get_all_children(in_node,arr:=[]):
	arr.push_back(in_node)
	for child in in_node.get_children():
		arr = get_all_children(child,arr)
	return arr
