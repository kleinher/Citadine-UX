extends Node2D
export var velocity = 0.3
export var alpha = 0.3

func _ready():
	modulate.a = alpha
	randomize()
	position = Vector2(-250,rand_range(50, 600))

func _process(delta):
	position.x += velocity

