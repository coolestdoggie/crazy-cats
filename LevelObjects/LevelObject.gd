class_name LevelObject extends RigidBody2D

var is_dragging
var have_drag_ability : bool
var is_in_collider_bounds : bool

func _ready():
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)


func _on_mouse_entered():
	is_in_collider_bounds = true
	print(is_in_collider_bounds)


func _on_mouse_exited():
	is_in_collider_bounds = false
	print(is_in_collider_bounds)


func _process(delta):
	handle_moving()
	handle_drag_and_drop()


func handle_moving():
	if is_dragging and have_drag_ability:
		global_position = get_global_mouse_position()


func handle_drag_and_drop():
	if Input.is_action_just_pressed("click") and is_dragging:
		is_dragging = false
	elif Input.is_action_just_pressed("click") and !is_dragging and is_in_collider_bounds:
		is_dragging = true