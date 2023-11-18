extends RigidBody2D

@export var move_range: float
var start_y := position.y
var end_y := position.y - move_range
	
func _ready():
	push_up_animation()


func push_up_animation():
	var tween = create_tween().set_loops()
	
	tween.tween_callback(update_coords)
	tween.tween_property(self, "position:y", end_y, 0.1).from(start_y).set_delay(3)
	tween.tween_property(self, "position:y", start_y, 0.1).from(end_y).set_delay(3)
	

func update_coords():
	start_y = position.y
	end_y = position.y - move_range
