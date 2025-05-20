# Obstacle.gd
extends Area2D

@export var speed: float = 200.0  # Velocidade para a esquerda
@export var destroy_x: float = -100.0  # Ponto em que o obstáculo é destruído

func _process(delta: float) -> void:
	position.x -= speed * delta

	# Se sair da tela, destrói
	if position.x < destroy_x:
		queue_free()
