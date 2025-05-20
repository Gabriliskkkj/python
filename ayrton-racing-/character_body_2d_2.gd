extends CharacterBody2D

# Velocidade do movimento
var speed = 1000
var movement_velocity = Vector2.ZERO

# Referências para os Sprites
@onready var background: Sprite2D = $Background
@onready var road: Sprite2D = $Road

func _ready():
	# Verificação para garantir que os nós foram encontrados
	if background == null:
		push_error("Nó 'Background' não encontrado! Verifique o caminho no editor.")
	if road == null:
		push_error("Nó 'Road' não encontrado! Verifique o caminho no editor.")

func get_input():
	# Pega o input vertical (cima e baixo) em vez de horizontal
	var input_dir = Vector2(0, Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up"))
	
	# Adiciona movimento obrigatório para cima (Y negativo é para cima)
	input_dir.x = 1  

	# Normaliza para não afetar a velocidade e multiplica pelo valor configurado
	movement_velocity = input_dir.normalized() * speed

func _physics_process(delta):
	get_input()
	move_and_collide(movement_velocity * delta)  

func _process(delta):
	if background != null:
		# Move o fundo para a esquerda
		background.position.x -= speed * delta
		
		# Quando o fundo sair da tela, reposiciona ele para o começo
		if background.position.x <= -background.texture.get_width():
			background.position.x = 0
