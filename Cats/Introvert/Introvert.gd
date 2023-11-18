class_name Introvert extends RigidBody2D

@export var move_range: float
var start_y : float = -8
var end_y : float = -22
	

func start_acting():
	push_up_animation()


func push_up_animation():
	var tween = create_tween().set_loops()
	
	tween.tween_property(self, "position:y", end_y, 0.1).set_delay(3)
	tween.tween_property(self, "position:y", start_y, 0.1).set_delay(3)
