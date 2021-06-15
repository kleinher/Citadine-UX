extends Node
var volume=0.0
var min_vol=-24
var music_position = 0.0
var audio 
const FILE_NAME = "user://config-data.json"
var config = {
	"tamanioLetras": 0,
	"sonido": 0,
	"contraste": 1,
	"resolucion_x": 1080,
	"resolucion_y": 720,
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
	audio = AudioStreamPlayer.new()
	var song = load("res://resources/Background_tune.ogg")
	song.set_loop(true)
	audio.stream = song
	audio.play()
	add_child(audio)	
	
	#Configuración del audio
	#music_position = 0.0
	#min_vol = find_node("AudioStreamPlayer").get_min()
	#find_node("AudioStreamPlayer").set_min(min_vol)

func changeVolume(value):
	print("Music changed. Level: %d" % value)
	volume=value	
	if _music_is_on():
		print("Music changed. Level: %d" % volume)
		_music("SUBIR")
	else:
		_music("BAJAR")

func _music_is_on():
	return volume > min_vol
	
func _music(action):
	if action == "SUBIR":
		audio.volume_db = volume
		if !audio.is_playing():
			audio.play(music_position)
		print("Music changed")
	else:
		music_position = audio.get_playback_position()
		audio.stop()
		print("Music stopped")
	

