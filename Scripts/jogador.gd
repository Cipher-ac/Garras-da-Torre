extends CharacterBody2D

@export var velocidade: float = 300.0
@export var cena_projetil: PackedScene

@onready var ponto_tiro = $PontoTiro
@onready var timer_tiro = $TimerTiro
@onready var coin_label = $"../CanvasLayer/Label"

var coins := 0

var stats = {
	"dano": 1,
	"velocidade": 300.0
}

func _physics_process(_delta: float) -> void:
	# 1. Movimentação
	var direcao_mov = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direcao_mov * stats["velocidade"]
	move_and_slide()

	# 2. Lógica de Tiro
	var direcao_tiro = Input.get_vector("shoot_left", "shoot_right", "shoot_up", "shoot_down")
	
	if direcao_tiro != Vector2.ZERO and timer_tiro.is_stopped():
		atirar(direcao_tiro)
	
	coin_label.text = "coins: " + str(coins)

func atirar(dir: Vector2) -> void:
	if cena_projetil == null: return
		
	var bala = cena_projetil.instantiate()
	
	var direcao_final = Vector2.ZERO
	if abs(dir.x) > abs(dir.y):
		direcao_final = Vector2(sign(dir.x), 0)
	else:
		direcao_final = Vector2(0, sign(dir.y))
		
	bala.direcao = direcao_final
	bala.dano = stats["dano"]
	bala.global_position = ponto_tiro.global_position
	
	
	get_parent().add_child(bala)
	
	timer_tiro.start()
