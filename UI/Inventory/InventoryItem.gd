class_name InventoryItem extends TextureRect

@export var amount_label : Label
var draggable : PackedScene
var can_drag : bool
var amount : int

func init(draggable, amount: int):
	self.draggable = draggable
	self.amount = amount
	init_sprite()
	init_amount()


func _process(delta):
	if Input.is_action_just_pressed("click") and can_drag:
		instantiate_draggable()
		amount = amount - 1
		init_amount()
		can_drag = false


func instantiate_draggable():
	var instance = draggable.instantiate()
	instance.have_drag_ability = true
	instance.is_dragging = true
	instance.input_pickable = true
	LevelDataService.current_level_instance.add_child(instance)

		
func init_sprite():
	var new_texture: Texture2D = get_texture_of_draggable()
	texture = new_texture


func get_texture_of_draggable() -> Texture2D:
	var instance = draggable.instantiate()
	for child in instance.get_children():
		if child is Sprite2D:
			var texture = child.texture
			var new_texture = texture.duplicate()
			instance.queue_free()
			return new_texture
		if child is AnimatedSprite2D:
			var animated_sprite = child as AnimatedSprite2D
			var texture = animated_sprite.sprite_frames.get_frame_texture(animated_sprite.sprite_frames.get_animation_names()[0], 0)
			var new_texture = texture.duplicate()
			instance.queue_free()
			return new_texture
			
	return null


func init_amount():
	if amount <= 0:
		queue_free()
		return

	amount_label.text = str(amount)
	amount_label.visible = true


func _on_area_2d_mouse_entered():
	can_drag = true


func _on_area_2d_mouse_exited():
	can_drag = false
