extends Node2D

onready var map = get_node("Mapa")
var menu = preload("res://scenes/Juego/PopUpMenu.tscn")
var currentTile = Vector2(10, 10)

func _ready():
	$SelectionTool/indicadorMouse.modulate = Color(255,255,153)
	$SelectionTool/indicadorMouse.modulate.a = 0.5

func _input(event):
	if event is InputEventKey:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN) #escondo el mouse
		#Determino la posición actual con el teclado
		if event.is_action_pressed("ui_right"):
			currentTile = Vector2(currentTile.x + 1, currentTile.y)
		if event.is_action_pressed("ui_left"):
			currentTile = Vector2(currentTile.x - 1, currentTile.y)
		if event.is_action_pressed("ui_down"):
			currentTile = Vector2(currentTile.x, currentTile.y + 1)
		if event.is_action_pressed("ui_up"):
			currentTile = Vector2(currentTile.x, currentTile.y - 1)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		var mouse_pos = get_global_mouse_position()
		var local_position = $Mapa.to_local(mouse_pos)
		#Determino la posición actual con el mouse
		currentTile = $Mapa.world_to_map(local_position)
		
	#Pinto la posición determinada
	$SelectionTool/indicadorMouse.position = $Mapa.map_to_world(currentTile)
	
	if event.is_action_pressed("mouse_lclick") or event.is_action_pressed("ui_accept"):
		elegirObjetoACrear(1) #Pongo un árbol en la posición

func elegirObjetoACrear(id):
	$Mapa.set_cell(currentTile.x,currentTile.y,id)

