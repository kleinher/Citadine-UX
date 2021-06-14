extends Node2D

onready var map = get_node("Mapa")
var menu = preload("res://PopUpMenu.tscn")
var crearMenu;
var hayMenu = false;
var theTile;
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var viejaTile;
func _ready():
	$SelectionTool/indicadorMouse.modulate.a = 0.3
	
			
# Called when the node enters the scene tree for the first time.
func _process(delta):
	var mouse_pos = get_global_mouse_position()
	var local_position = $Mapa.to_local(mouse_pos)
	var tile = $Mapa.world_to_map(local_position)
	if !$SelectionTool/MenuContainer.get_child_count() > 0:
		if ($Mapa.get_cellv(tile) == -1) and (viejaTile != tile):
			#Se pone el selector amarillo 
			$SelectionTool/indicadorMouse.position = $Mapa.map_to_world(tile)
			$SelectionTool/indicadorMouse.modulate = Color(255,255,153)
			$SelectionTool/indicadorMouse.modulate.a = 0.3
			viejaTile = tile
			#habilito el uso de menu en este tile
			crearMenu = true
		elif(viejaTile != tile):
			#Se pone el selector rojo
			$SelectionTool/indicadorMouse.position = $Mapa.map_to_world(tile)
			$SelectionTool/indicadorMouse.modulate = Color(255,0,0)
			$SelectionTool/indicadorMouse.modulate.a = 0.3
			viejaTile = tile
			crearMenu = false

func _input(event):
	
	var mouse_pos = get_global_mouse_position()
	var local_position = $Mapa.to_local(mouse_pos)
	if event.is_action_pressed("ui_accept"):
		var tile = $Mapa.world_to_map(local_position)
		$Posicion.text = "screen: %s \n tile: %s" % [mouse_pos,tile]
		#Cuando hay un menú creado
		if $SelectionTool/MenuContainer.get_child_count() > 0:
			$SelectionTool/MenuContainer.get_child(0).queue_free()
		else:
			if crearMenu:
				var aux = menu.instance();
				var tileIndex = $Mapa.get_cellv(tile)
				aux.rect_position = mouse_pos
				theTile = tile
				aux.connect("menu_activado",self,"elegirObjetoACrear")
				$SelectionTool/MenuContainer.add_child(aux)
		
func elegirObjetoACrear(id):
	$Mapa.set_cell(theTile.x,theTile.y,id)
	
