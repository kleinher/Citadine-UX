extends TileMap
signal tile_agregado;
func _ready():
	pass
	
func set_cell(x, y, tile, flip_x=false, flip_y=false, transpose=false, autotile_coord=Vector2()):
	emit_signal("tile_agregado",tile);
	.set_cell(x, y, tile, flip_x, flip_y, transpose, autotile_coord)


