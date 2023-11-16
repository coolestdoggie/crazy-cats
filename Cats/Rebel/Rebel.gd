extends RigidBody2D

@export var raycast: RayCast2D
@export var cooldown_between_pushes: float
@export var impulse_force: float

var current_cooldown: float

func _ready():
	current_cooldown = cooldown_between_pushes


func _process(delta):
	current_cooldown = current_cooldown - delta

	if not raycast.collide_with_bodies or current_cooldown > 0:
		return
	
	push_raycasted_body()


func push_raycasted_body():
	var rigid_body = (raycast.get_collider() as RigidBody2D)	
	if !rigid_body:
		return

	rigid_body.apply_impulse(Vector2(80, -impulse_force), Vector2(5, -20))

	current_cooldown = cooldown_between_pushes
	