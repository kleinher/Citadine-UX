extends Node2D

var ganaste = preload("res://scenes/Juego/GanasteScene.tscn")
var perdiste = preload("res://scenes/Juego/PerdisteScene.tscn")
var inGameMenu = preload("res://scenes/InGameMenu.tscn")
var currentLevelIndex = 0;
var currentLevel

var niveles = [
	preload("res://scenes/Juego/nivel1.tscn"),
	preload("res://scenes/Juego/nivel2.tscn")
]
func _ready():
	connect("siguiente_nivel",self,"changeLevel")
	currentLevel = niveles[currentLevelIndex].instance()
	add_child(currentLevel)

#Esta función se invoca con el botón de "siguiente nivel" en la escena 
#"GanasteScene"
func changeLevel():
	remove_child(get_node("GanasteScene"))
	get_tree().paused = false
	currentLevelIndex+=1;
	if currentLevelIndex < 2:
		currentLevel = niveles[currentLevelIndex].instance()
		add_child(currentLevel)
	
#Se invoca desde el nivel actual cuando finaliza el tiempo.
#La idea seria ver si gano o perdió y 
func calcularResultado():
	get_tree().paused = true
	#Si perdiste volver a instanciar current level
	 
	#Si ganaste Remove the current level
	remove_child(currentLevel)
	currentLevel.call_deferred("free")
	add_child(ganaste.instance())
