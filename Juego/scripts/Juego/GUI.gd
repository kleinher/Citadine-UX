extends MarginContainer

var count_casa = 0
var count_arbol = 0
var count_basurero = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("tile_agregado",self,"actualizarContador")
	
func actualizarContador(id):
	print("Entro")
	match id:
		0:
			count_arbol+=1
			$HBoxContainer/Bars/ArbolCounter/Counter/Background/Number.text = count_arbol
		1:
			count_casa+=1
		2:
			count_basurero+=1
		


func _on_Mapa_tile_agregado(id):
	match id:
		0:
			$HBoxContainer/Bars/CasaCounter.incrementarValor()
		1:
			$HBoxContainer/Bars/ArbolCounter.incrementarValor()

