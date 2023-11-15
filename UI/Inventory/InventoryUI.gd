class_name InventoryUI extends HBoxContainer

func update_inventory():
	destroy_inventory_items()
	create_inventory_items_according_to_current_level()


func destroy_inventory_items():
	if get_child_count() > 0:
		var children = get_children()
		for c in children:
			remove_child(c)
			c.queue_free()

func create_inventory_items_according_to_current_level():
	pass

