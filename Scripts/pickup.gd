extends Area2D

@export var stat_name := ""
@export var amount := 1

func _on_body_entered(body):
	if body is CharacterBody2D:
		body.stats[stat_name] += amount
		queue_free()
