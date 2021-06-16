extends Node2D


func _ready():
	modulate = Color(255,255,153)
	modulate.a = 0.3
func rojo():
	modulate = Color(255,0,153)
	modulate.a = 0.3
func normal():
	modulate = Color(255,255,153)
	modulate.a = 0.3

