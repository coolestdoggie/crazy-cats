extends RigidBody2D

@export var bulb_popup : BulbPopup
@export var text_popup : TextPopup

func _on_body_entered(body:Node):
	if !body.is_in_group("food"):
		return

	body.queue_free()
	bulb_popup.activate_bubble()
	await get_tree().create_timer(3.0).timeout
	text_popup.activate_bubble()
