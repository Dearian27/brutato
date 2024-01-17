extends Node2D

@onready var mob = $".."

func play_walk():
	%AnimationPlayer.play("walk")

func play_idle():
	%AnimationPlayer.play("idle")
	%AnimationPlayer.queue("walk")


func play_hurt():
	%AnimationPlayer.play("hurt")
	%AnimationPlayer.queue("walk")

func _process(delta):
	if mob.velocity.length() > 0:
		play_walk();
	else:
		play_idle();
