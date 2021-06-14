extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	change_window_size(Vector2(Globales.config.resolucion_x, Globales.config.resolucion_y))


func change_window_size(vector):
	Globales.config.resolucion_x = vector.x
	Globales.config.resolucion_y = vector.y
	Globales.save()
	OS.set_window_size(vector)
