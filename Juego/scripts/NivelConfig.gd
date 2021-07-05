extends Node

const LEVEL_CANT = 2
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func get_level():
	return Globales.config.nivel

func next_level():
	if LEVEL_CANT > Globales.config.nivel + 1:
		Globales.config.nivel += 1
	else:
		Globales.config.nivel = 0
	Globales.save()
