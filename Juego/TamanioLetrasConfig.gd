extends Node

const TITULOS = [72, 42, 22] #grande, medio, pequeño
const BOTONES = [42, 22, 12]
var tamanio_letras = 0 # Empieza en 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func get_titulo_size():
	return TITULOS[tamanio_letras]
	
func get_boton_size():
	return BOTONES[tamanio_letras]
