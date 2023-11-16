class_name InventoryItem extends TextureRect

@export var amount_label : Label

func init(draggable, amount: int):
	init_sprite(draggable)
	init_amount(amount)

func init_sprite(draggable):
	var new_texture: Texture2D = get_texture_of(draggable)
	texture = new_texture
	print(texture)


func get_texture_of(draggable: PackedScene) -> Texture2D:
	var instance = draggable.instantiate()
	for child in instance.get_children():
		if child is Sprite2D:
			var texture = child.texture
			var new_texture = texture.duplicate()
			instance.queue_free()
			return new_texture
	return null


func init_amount(amount: int):
	amount_label.text = str(amount)
