extends CharacterBody2D

const SPEED = 300.0
const DASH_SPEED = 9000.0
@export var drag_factor = 5.0
var is_dashing = false

func _physics_process(delta):
	var movement_vector := Vector2(
		float(Input.get_action_strength("right")) - float(Input.get_action_strength("left")),
		float(Input.get_action_strength("down")) - float(Input.get_action_strength("up"))
	)
	var move_direction = movement_vector.normalized()
	var desired_velocity = move_direction * SPEED

	if Input.is_action_just_pressed("space") and not is_dashing:
		is_dashing = true
		desired_velocity = move_direction * DASH_SPEED

	if is_dashing and velocity.length() <= DASH_SPEED:
		is_dashing = false
	
	var steering
	if is_dashing:
		steering = desired_velocity;
	else:
		steering = desired_velocity - velocity
	
	velocity += steering / drag_factor
	set_velocity(velocity)
	move_and_slide()
	velocity = velocity
