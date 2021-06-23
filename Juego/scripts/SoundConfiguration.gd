extends Node
var volume=0.0
var min_vol=-24
var music_position = 0.0
var audio 

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	createAudioStreamPlayer()



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


#Configuracion del audio
func createAudioStreamPlayer():
	audio = AudioStreamPlayer.new()
	var song = load("res://resources/Background_tune.ogg")
	song.set_loop(true)
	audio.stream = song
	#audio.play()
	add_child(audio)
	audio.volume_db=Globales.config.sonido	
	changeVolume(audio.volume_db)
	
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
		audio.volume_db= min_vol
		audio.stop()
		print("Music stopped")
	
	Globales.config.sonido=audio.volume_db	
	Globales.save()
