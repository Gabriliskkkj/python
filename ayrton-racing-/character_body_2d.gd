extends CharacterBody2D

# Velocidade do movimento
var speed = 1000
var movement_velocity = Vector2.ZERO

# Referências para os Sprites
@onready var background: Sprite2D = $Background
@onready var road: Sprite2D = $Road

func _ready():
	# Cria as ações WASD, caso ainda não existam
	var actions = {
		"move_up": KEY_W,
		"move_down": KEY_S,
		"move_left": KEY_A,
		"move_right": KEY_D
	}
	

			
	# Verificação para garantir que os nós foram encontrados
	if background == null:
		push_error("Nó 'Background' não encontrado! Verifique o caminho no editor.")
	if road == null:
		push_error("Nó 'Road' não encontrado! Verifique o caminho no editor.")

func get_input():
	# Pega input WASD e setas
	var input_dir = Vector2(
		Input.get_action_strength("move_right") + Input.get_action_strength("ui_right") - 
		(Input.get_action_strength("move_left") + Input.get_action_strength("ui_left")),
		Input.get_action_strength("move_down") + Input.get_action_strength("ui_down") - 
		(Input.get_action_strength("move_up") + Input.get_action_strength("ui_up"))
	)

	movement_velocity = input_dir.normalized() * speed if input_dir.length() > 0 else Vector2.ZERO

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
