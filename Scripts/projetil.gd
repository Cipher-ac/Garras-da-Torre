extends Area2D

@export var velocidade_base: float = 500.0
var direcao: Vector2 = Vector2.ZERO
var velocidade_adicional: Vector2 = Vector2.ZERO

var dano = 1

func _process(delta: float) -> void:
	var movimento_final = (direcao * velocidade_base) + velocidade_adicional
	global_position += movimento_final * delta

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
