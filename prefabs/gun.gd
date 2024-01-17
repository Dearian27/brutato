extends Area2D

func _physics_process(delta):
	var near_enemies = get_overlapping_bodies();
	if near_enemies.size() > 0:
		var target_enemy = near_enemies.front();
		look_at(target_enemy.global_position);
