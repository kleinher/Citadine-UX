extends TileMap
signal tile_agregado;

var level_codes = {
	"n": -1, #nada
	"a": 1, #arbol
	"c": 4, #casa
	"t": 0, #tocon
 }

var level_1 = [
	"nnnnnnnnnnnnnnnnnnnnn",
	"nnnnnnnnnnnnnnnnnnnnn",
	"nnnnnncncnnnnnnnnnnnn",
	"nnttnnnnnnnnnnnnnnnnn",
	"nnnnnnnnnnnnnnnncnnnn",
	"nnnnnnnnnnnnntnnnnnnn",
	"nnncnnnnnnnnnnnnnnnnn",
	"nnnnnnnnntnnnnnnnnnnn",
	"nnnncnnnnnnnnnnnnnnnn",
	"nnnnnnnnnnnncncnnnnnn",
	"nnnttnnnnnnnnnnnnnnnn",
	"nncnnnnnnnnnnnncncnnn",
	"nnnnnnnnnnnnnnnnnnnnn",
	"nnnnnnnnttnnnnnnnnnnn",
]	
	
var levels = [
	level_1,
]

func set_cell(x, y, tile, flip_x=false, flip_y=false, transpose=false, autotile_coord=Vector2()):
	emit_signal("tile_agregado",tile);
	.set_cell(x, y, tile, flip_x, flip_y, transpose, autotile_coord)


func _ready():
	var level = levels[NivelConfig.get_level() - 1] # get_level inicia desde 1
	for i in range(0,level.size()):
		for j in range(0, level[i].length()):
			set_cell(j, i, level_codes[level[i][j]])
