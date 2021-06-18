extends Node

const TITULOS = [72, 42, 22] #grande, medio, pequeño
const BOTONES = [42, 22, 12]
const TEXTOS = [42, 32, 20]
var tamanio_letras = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	tamanio_letras = Globales.config.tamanioLetras

func set_tamanio_letras(size):
	Globales.config.tamanioLetras = size
	Globales.save()
	tamanio_letras = size

func get_titulo_size():
	return TITULOS[tamanio_letras]
	
func get_boton_size():
	return BOTONES[tamanio_letras]

func get_textos_size():
	return TEXTOS[tamanio_letras]
