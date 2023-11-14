extends Node2D

var draggable := false

func _process(delta):
	if Input.is_action_pressed("click") and draggable:
		get_parent().global_position = get_global_mouse_position()


func _on_area_2d_mouse_entered():
	get_parent().scale = Vector2(1.1, 1.1)
	draggable = true

func _on_area_2d_mouse_exited():
	get_parent().scale = Vector2.ONE
	draggable = false
