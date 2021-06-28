extends Node
signal voice_activated
var volume=0.0
var min_vol=-24
var music_position = 0.0
var audio 

# Called when the node enters the scene tree for the first time.
func _ready():
	audio = AudioStreamPlayer.new()

func play_voice(resource):
	if not Globales.config.voz_encendida: return
	var voice = load(resource)
	voice.set_loop(false)
	audio.stream = voice
	#audio.play()
	add_child(audio)
	audio.volume_db=Globales.config.volumen_voz	
	changeVolume(audio.volume_db)

func toggle_voice():
	if Globales.config.voz_encendida:
		Globales.config.voz_encendida = false
		audio.stop()
	else:
		Globales.config.voz_encendida = true
		emit_signal("voice_activated")
	Globales.save()
		
	
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
