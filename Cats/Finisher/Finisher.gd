extends RigidBody2D


func _on_body_entered(body:Node):
	if !body.is_in_group("food"):
		return

	body.queue_free()
