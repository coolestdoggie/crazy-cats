extends RigidBody2D

@export var bulb_popup : BulbPopup

func _on_body_entered(body:Node):
	if !body.is_in_group("food"):
		return

	bulb_popup.activate_bubble()
	body.queue_free()
