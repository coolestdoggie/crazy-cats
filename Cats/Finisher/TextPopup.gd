class_name TextPopup extends NinePatchRect

func _ready():
	reset_animation()

func activate_bubble():
	activate_bubble_appear_animation()

func activate_bubble_appear_animation():
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(0,0), 0)
	tween.tween_property(self, "scale", Vector2(1,1), 0.7).set_trans(Tween.TRANS_SPRING)
	tween.tween_property(self, "scale", Vector2(0,0), 0.7).set_trans(Tween.TRANS_SPRING).set_delay(2)

func reset_animation():
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(0,0), 0)
