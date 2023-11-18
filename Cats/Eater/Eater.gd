class_name Eater extends LevelObject

@export var collision_shape : CollisionShape2D
var jumped : bool

func _on_eat_area_body_entered(body:Node2D):
	if body.is_in_group("food"):
		eat(body)
	elif body.is_in_group("ball") and !jumped:
		jump(body)


func eat(food):
	await get_tree().create_timer(1.0).timeout
	food.queue_free()


func jump(body: Node2D):
	var direction_x : int
	if body.global_position.x < global_position.x:
		direction_x = 1
	else:
		direction_x = -1
	apply_impulse(Vector2(80 * direction_x, -500))
	jumped = true
