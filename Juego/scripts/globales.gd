extends Node

const FILE_NAME = "user://config-data.json"
var config = {
	"tamanioLetras": 0,
	"sonido": -5,
	"volumen_voz": 0,
	"voz_encendida": true,
	"velocidad_voz": 1.0,
	"resolucion_x": 1080,
	"resolucion_y": 720,
	"nivel": 0,
	"dificultad": 0,
}

func save():
	var file = File.new()
	file.open(FILE_NAME, File.WRITE)
	file.store_string(to_json(config))
	file.close()
	
func load_config():
	var file = File.new()
	if file.file_exists(FILE_NAME):
		file.open(FILE_NAME, File.READ)
		var data = parse_json(file.get_as_text())
		file.close()
		if typeof(data) == TYPE_DICTIONARY:
			config = data
		else:
			printerr("Corrupted data!")
	else:
		printerr("No saved data!")
		
func _ready():
	var config_file = File.new()
	if not config_file.file_exists(FILE_NAME):
		save()
	else:
		load_config()
