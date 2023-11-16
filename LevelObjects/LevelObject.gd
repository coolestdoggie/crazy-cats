class_name LevelObject extends RigidBody2D

var is_dragging

func _process(delta):
	if is_dragging:
		global_position = get_global_mouse_position()

	if Input.is_action_just_pressed("click"):
		is_dragging = false
