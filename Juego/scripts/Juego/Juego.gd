extends Node2D

signal tiempo_finalizado
onready var map = get_node("Mapa")
var menu = preload("res://scenes/Juego/PopUpMenu.tscn")
export var contadorArbol = 0
export var contadorBasura = 0
export var contadorCalle = 0
var currentTile = Vector2(10, 10)
const MAX_Y = 13
const MAX_X = 20
var tilesetMapa = preload("res://resources/tileset/Mapa.tres")
var tilesetCalles = preload("res://resources/tileset/Calles.tres")
var tilesMapa = {
	"tocon": 	 tilesetMapa.find_tile_by_name("tocon"),
	"arbol":	 tilesetMapa.find_tile_by_name("arbol"),
	"casaBasura":tilesetMapa.find_tile_by_name("casaVerdeBasura"),
	"casa":		 tilesetMapa.find_tile_by_name("casaVerde")
				}
var tilesCalles = {
	"codoULsucio":tilesetCalles.find_tile_by_name("codoUL-sucio"),
	"codoURsucio":tilesetCalles.find_tile_by_name("codoUR-sucio"),
	"codoDLsucio":tilesetCalles.find_tile_by_name("codoDL-sucio"),
	"codoDRsucio":tilesetCalles.find_tile_by_name("codoDR-sucio"),
	"codoULlimpio":tilesetCalles.find_tile_by_name("codoUL-limpio"),
	"codoURlimpio":tilesetCalles.find_tile_by_name("codoUR-limpio"),
	"codoDLlimpio":tilesetCalles.find_tile_by_name("codoDL-limpio"),
	"codoDRlimpio":tilesetCalles.find_tile_by_name("codoDR-limpio")
}
var dijo_voz = false
var prev_voz
func _ready():
	display_tutorial();
	$NubeTimer._on_NubeTimer_timeout()
	connect("tiempo_finalizado",self,"tiempoFinalizado")
	
func _input(event):
	#Pintar otro color
	
	#Movimiento del selector con el teclado
	if event is InputEventKey:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN) #escondo el mouse
		#Determino la posición actual con el teclado
		if event.is_action_pressed("ui_right"):
			if currentTile.x < MAX_X: currentTile = Vector2(currentTile.x + 1, currentTile.y)
		if event.is_action_pressed("ui_left"):
			if currentTile.x > 0: currentTile = Vector2(currentTile.x - 1, currentTile.y)
		if event.is_action_pressed("ui_down"):
			if currentTile.y < MAX_Y: currentTile = Vector2(currentTile.x, currentTile.y + 1)
		if event.is_action_pressed("ui_up"):
			if currentTile.y > 0: currentTile = Vector2(currentTile.x, currentTile.y - 1)
		if event.is_action("arreglar"):
			elegirObjetoACrear($Mapa.get_cellv(currentTile),$Calles.get_cellv(currentTile))
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		var mouse_pos = get_global_mouse_position()
		var local_position = $Mapa.to_local(mouse_pos)
		#Determino la posición actual con el mouse
		currentTile = $Mapa.world_to_map(local_position)
	
	
	if prev_voz != currentTile:
		prev_voz = currentTile
		match $Mapa.get_cellv(currentTile):
			tilesMapa.tocon:
				VoiceConfiguration.play_voice("res://resources/voices/GameVoices/arbol_talado.ogg")
			tilesMapa.arbol:
				VoiceConfiguration.play_voice("res://resources/voices/GameVoices/arbol.ogg")
			tilesMapa.casa:
				VoiceConfiguration.play_voice("res://resources/voices/GameVoices/casa.ogg")
			tilesMapa.casaBasura:
				VoiceConfiguration.play_voice("res://resources/voices/GameVoices/casa_con_basura.ogg")
		match $Calles.get_cellv(currentTile):
			tilesCalles.codoDLsucio, tilesCalles.codoDRsucio, tilesCalles.codoULsucio, tilesCalles.codoURsucio:
				VoiceConfiguration.play_voice("res://resources/voices/GameVoices/boca_de_tormenta_tapada.ogg")
			tilesCalles.codoDLlimpio, tilesCalles.codoDRlimpio, tilesCalles.codoULlimpio, tilesCalles.codoURlimpio:
				VoiceConfiguration.play_voice("res://resources/voices/GameVoices/boca_de_tormenta.ogg")
	$SelectionTool/indicadorMouse.position = $Mapa.map_to_world(currentTile)
	if event.is_action_pressed("mouse_lclick") or event.is_action_pressed("ui_accept"):
		elegirObjetoACrear($Mapa.get_cellv(currentTile), $Calles.get_cellv(currentTile)) #Pongo un árbol en la posición

func elegirObjetoACrear(idMapa, idCalles):
	match idMapa:
		tilesMapa.tocon:
			contadorArbol+=1
			arreglarTileMapa(tilesMapa.arbol,$Mapa)
		tilesMapa.casaBasura:
			arreglarTileMapa(tilesMapa.casa,$Mapa)
			contadorBasura+=1
	match idCalles:
		tilesCalles.codoDLsucio:
			contadorCalle+=1
			arreglarTileMapa(tilesCalles.codoDLlimpio,$Calles)
		tilesCalles.codoULsucio:
			contadorCalle+=1
			arreglarTileMapa(tilesCalles.codoULlimpio,$Calles)
		tilesCalles.codoDRsucio:
			contadorCalle+=1
			arreglarTileMapa(tilesCalles.codoDRlimpio,$Calles)
		tilesCalles.codoDRsucio:
			contadorCalle+=1
			arreglarTileMapa(tilesCalles.codoDRlimpio,$Calles)

func arreglarTileMapa(tile,tilemap):
	tilemap.set_cell(currentTile.x,currentTile.y,tile)
	var currentTilePosition = tilemap.map_to_world(currentTile)
	var test = tilemap.to_global(currentTilePosition)
	$Feedback.coinFeedback(currentTile,test)

func display_tutorial():
	var tuto = load("res://scenes/Tutorial.tscn").instance()
	add_child(tuto)
	get_tree().paused = true

func resetear():
	contadorArbol = 0
	contadorBasura = 0
	contadorCalle = 0
	
func tiempoFinalizado():
	get_parent().calcularResultado(); 
  
