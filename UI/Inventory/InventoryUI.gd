class_name InventoryUI extends VBoxContainer

@export var inventory_item_scene : PackedScene


func update_inventory():
	destroy_inventory_items()
	create_inventory_items_for_current_level()


func destroy_inventory_items():
	if get_child_count() > 0:
		var children = get_children()
		for c in children:
			remove_child(c)
			c.queue_free()

func create_inventory_items_for_current_level():
	var current_level_data : LevelData = LevelDataService.get_data_for_current_level()
	var draggables_by_count = current_level_data.draggables_by_count

	for draggable_id in draggables_by_count:
		var amount_in_inventory = draggables_by_count[draggable_id]
		create_inventory_item(draggable_id, amount_in_inventory)


func create_inventory_item(draggable_id: String, amount: int):
	var draggable = ObjectsDataService.get_scene_by_id(draggable_id)

	var inventory_item_instance = inventory_item_scene.instantiate() as InventoryItem
	add_child(inventory_item_instance)

	inventory_item_instance.init(draggable, amount)
