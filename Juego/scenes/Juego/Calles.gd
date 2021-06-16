extends TileMap

var level_codes = {
	"p": 11, #pasto
	"a": 8, #agua
	"s": 19, #south (giro a abajo a la derecha desde posición horizontal)
	"e": 2, #east (giro a arriba a la derecha desde posicion vertical)
	"t": 4, #south + 1 (giro a abajo a la derecha desde posición vertical)
	"f": 5, #east + 1 (giro a arriba a la derecha desde posición horizonatal)
	"h": 1, #horizontal
	"v": 0, #vertical
	"b": 9, #bridge
	"i": 7, #interseccion norte a horizontal
	"j": 12, #interseccion + 1, oeste a vertical
	"k": 13, #interseccion + 2, vertical a este
}

var nivel_1 = [
	"ppppppppppappppppppppppppppp",
	"ppppppppppappehhhhhspppppppp",
	"ppppppppppappvpppppvpppppppp",
	"pppppehhhhbhhihspppvpppppppp",
	"pppppvppppappppvpppvpppppppp",
	"ehhhhjppppappppkhhhisppppppp",
	"vppppvppppappppvppppvppppppp",
	"vppppvppppappppvppppvppppppp",
	"vppppthhhhbhhhhfppppvppppppp",
	"vpppppppppapppppppppvppppppp",
	"vpppppppppapppppppppvppppppp",
	"vpppppppppapppppppppvppppppp",
	"thhhhhhhhhbhhhhhhhhhfppppppp",
	"ppppppppppappppppppppppppppp",
]

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(0,nivel_1.size()):
		for j in range(0, nivel_1[i].length()):
			set_cell(j, i, level_codes[nivel_1[i][j]])

