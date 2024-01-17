extends CharacterBody2D

@onready var player = get_node("/root/Game/Player");
const SPEED = 100;

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position);
	velocity = direction * SPEED;
	move_and_slide();
