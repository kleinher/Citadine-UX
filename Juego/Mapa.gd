extends Node2D

onready var map = get_node("Mapa")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _input(event):
	if event.is_action_pressed("mouse_lclick"):
		var mouse_pos = get_global_mouse_position()
		var local_position = $Mapa.to_local(mouse_pos)
		var tile = $Mapa.world_to_map(local_position)

		
		$Mapa.set_cell(tile.x,tile.y,1)
		$Posicion.text = "screen: %s \n tile: %s" % [mouse_pos,tile]
	
	
