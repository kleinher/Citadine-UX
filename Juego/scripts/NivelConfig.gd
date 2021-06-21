extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func get_level():
	return 1

func next_level():
	Globales.config.nivel += 1
	Globales.save()
