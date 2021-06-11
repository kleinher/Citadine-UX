extends Node2D

onready var map = get_node("Mapa")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var viejaTile = Vector2(randi(),randi());
func _ready():
	$SelectionTool/indicadorMouse.modulate.a = 0.3
	var aux = 100
	var auxy =0
	var local_position = $Mapa.to_local(Vector2(0,100))
	var tile = $Mapa.world_to_map(local_position)
	for i in 10:
		auxy +=150;
		aux =0;
		for j in 5:
			
			#$Mapa.set_cell(tile,0)
			aux+=300
			local_position = $Mapa.to_local(Vector2(aux, auxy))
			tile = $Mapa.world_to_map(local_position)
			$Mapa.set_cell(tile.x,tile.y,0)
			
# Called when the node enters the scene tree for the first time.
func _process(delta):
	var mouse_pos = get_global_mouse_position()
	var local_position = $Mapa.to_local(mouse_pos)
	var tile = $Mapa.world_to_map(local_position)
	
	if ($Mapa.get_cellv(tile) == -1) and (viejaTile != tile): 
		$SelectionTool/indicadorMouse.position = $Mapa.map_to_world(tile)
		$SelectionTool/indicadorMouse.modulate = Color(255,255,153)
		$SelectionTool/indicadorMouse.modulate.a = 0.3
		viejaTile = tile
	elif(viejaTile != tile):
		$SelectionTool/indicadorMouse.position = $Mapa.map_to_world(tile)
		$SelectionTool/indicadorMouse.modulate = Color(255,0,0)
		$SelectionTool/indicadorMouse.modulate.a = 0.3
		viejaTile = tile
	
func _input(event):
	if event.is_action_pressed("mouse_lclick"):
		var mouse_pos = get_global_mouse_position()
		var local_position = $Mapa.to_local(mouse_pos)
		
		var tile = $Mapa.world_to_map(local_position)
		$Posicion.text = "screen: %s \n tile: %s" % [mouse_pos,tile]
		$Mapa.set_cell(tile.x,tile.y,1)
	
	
