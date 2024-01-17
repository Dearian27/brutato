extends Sprite2D

const SPRITES_MAP := {
	Vector2.RIGHT: preload("godot_right.png"),
	Vector2.DOWN: preload("godot_bottom.png"),
	Vector2.LEFT: preload("godot_right.png"),
	Vector2.UP: preload("godot_up.png"),
	Vector2(1.0, 1.0): preload("godot_bottom_right.png"),
	Vector2(1.0, -1.0): preload("godot_up_right.png"),
	Vector2(-1.0, -1.0): preload("godot_up_right.png"),
	Vector2(-1.0, 1.0): preload("godot_bottom_right.png"),
}

var look_direction = Vector2.DOWN;

func _process(_delta: float) -> void:
	var movement_vector := Vector2(
		float(Input.is_action_pressed("right")) - float(Input.is_action_pressed("left")),
		float(Input.is_action_pressed("down")) - float(Input.is_action_pressed("up"))
	)
	
	if movement_vector.length() > 0 and movement_vector != look_direction:
		texture = SPRITES_MAP[movement_vector];
		look_direction = movement_vector;
		flip_h = sign(look_direction.x) == -1;
