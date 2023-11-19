extends LevelObject

@export var raycast: RayCast2D
@export var cooldown_between_pushes: float
@export var impulse_force: float
@export var animated_sprite : AnimatedSprite2D

var current_cooldown: float
var started_acting : bool
var push_is_happening : bool

func start_acting():
	started_acting = true
	current_cooldown = cooldown_between_pushes


func _process(delta):
	super._process(delta)

	if !started_acting:
		return
	current_cooldown = current_cooldown - delta

	if not raycast.collide_with_bodies or current_cooldown > 0 or push_is_happening:
		return
	
	push_raycasted_body()


func push_raycasted_body():
	var rigid_body = (raycast.get_collider() as RigidBody2D)	
	if !rigid_body:
		return
	
	push_is_happening = true

	animated_sprite.play("push")
	await get_tree().create_timer(1.6).timeout
	var angle = rotation
	if rigid_body.is_in_group("fat_cat"):
		rigid_body.apply_impulse(Vector2(cos(angle), sin(angle)) * 1000)
	else:
		rigid_body.apply_impulse(Vector2(cos(angle), sin(angle)) * impulse_force)
	
	await animated_sprite.animation_finished
	animated_sprite.play("idle")
	current_cooldown = cooldown_between_pushes
	push_is_happening = false

	
