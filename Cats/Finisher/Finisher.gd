class_name Finisher extends RigidBody2D

@export var bulb_popup : BulbPopup
@export var text_popup : TextPopup
@export var animated_sprite : AnimatedSprite2D

signal ate_food

func _on_body_entered(body:Node):
	if !body.is_in_group("food"):
		return

	launch_animation()

	body.queue_free()
	await get_tree().create_timer(3.0).timeout
	bulb_popup.activate_bubble()
	await get_tree().create_timer(3.0).timeout
	text_popup.activate_bubble()
	
	ate_food.emit()
	LevelDataService.set_next_level()


func launch_animation():
	animated_sprite.play("eat")
	await animated_sprite.animation_finished
	animated_sprite.play("close_eyes")
	await get_tree().create_timer(1).timeout
	animated_sprite.play("explode")
	await animated_sprite.animation_finished
	animated_sprite.play("idle")
