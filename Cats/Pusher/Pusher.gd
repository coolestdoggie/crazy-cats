extends LevelObject

@export var raycast: RayCast2D
@export var cooldown_between_pushes: float
@export var impulse_force: float

var current_cooldown: float
var started_acting : bool

func start_acting():
	started_acting = true
	current_cooldown = cooldown_between_pushes


func _process(delta):
	super._process(delta)

	if !started_acting:
		return
	current_cooldown = current_cooldown - delta

	if not raycast.collide_with_bodies or current_cooldown > 0:
		return
	
	push_raycasted_body()


func push_raycasted_body():
	var rigid_body = (raycast.get_collider() as RigidBody2D)	
	if !rigid_body:
		return

	var angle = rotation
	rigid_body.apply_impulse(Vector2(cos(angle), sin(angle)) * impulse_force)

	current_cooldown = cooldown_between_pushes
	
