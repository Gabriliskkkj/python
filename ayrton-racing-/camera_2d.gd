extends Camera2D

var speed := 150

func _physics_process(_delta):
	var velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * speed
	position += velocity * _delta
