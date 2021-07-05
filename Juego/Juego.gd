extends Node2D

var ganaste = preload("res://scenes/Juego/GanasteScene.tscn")
var perdiste = preload("res://scenes/Juego/PerdisteScene.tscn")
var inGameMenu = preload("res://scenes/InGameMenu.tscn")
var currentLevelIndex
var currentLevel

var niveles = [
	preload("res://scenes/Juego/nivel1.tscn"),
	preload("res://scenes/Juego/nivel2.tscn")
]

	
var problemas = [{ "arbol": 26,
			   "basura":5,
			   "calle": 2
			 },
			{ "arbol": 30,
			   "basura":6,
			   "calle": 3
			 }] 

func _ready():
	connect("siguiente_nivel",self,"changeLevel")
	currentLevelIndex = NivelConfig.get_level()
	currentLevel = niveles[currentLevelIndex].instance()
	add_child(currentLevel)

#Esta función se invoca con el botón de "siguiente nivel" en la escena 
#"GanasteScene"
func changeLevel():
	get_tree().paused = false
	if currentLevelIndex < niveles.size():
		currentLevel = niveles[currentLevelIndex].instance()
		add_child(currentLevel)
	else:
		currentLevelIndex =0
		currentLevel = niveles[currentLevelIndex].instance()
		add_child(currentLevel)
	remove_child(get_node("PerdisteScene"))
	remove_child(get_node("GanasteScene"))
	print("Entro")
#Se invoca desde el nivel actual cuando finaliza el tiempo.
#La idea seria ver si gano o perdió y 
func calcularResultado():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	#Si perdiste volver a instanciar current level
	if !ganaste():
		get_tree().change_scene("res://scenes/Juego/PerdisteScene.tscn")
	else:
		NivelConfig.next_level()
		get_tree().change_scene("res://scenes/Juego/GanasteScene.tscn")
	
func ganaste():
	var total = problemas[currentLevelIndex].arbol + problemas[currentLevelIndex].basura + problemas[currentLevelIndex].calle;
	var actual = currentLevel.contadorArbol +currentLevel.contadorBasura +currentLevel.contadorCalle
	var porcentaje = (actual * 100)/total
	#80% de los arreglos para pasar al siguiente lvl
	if(porcentaje > 80):
		return true
	else:
		return false
	
