extends Node

const TIMES = [60, 40, 25]

func _ready():
	pass

func get_dificultad():
	return Globales.config.dificultad

func get_time_from_dificultad():
	return TIMES[get_dificultad()]

func set_dificultad(dificultad):
	Globales.config.dificultad = dificultad
	Globales.save()
