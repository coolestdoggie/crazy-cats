extends LevelObject


func _on_eat_area_body_entered(body:Node2D):
	if body.is_in_group("food"):
		eat(body)


func eat(food):
	await get_tree().create_timer(1.0).timeout
	food.queue_free()
