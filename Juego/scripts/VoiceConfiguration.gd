extends Node
signal voice_activated
var music_position = 0.0
var audio
var pitch
const BUS_INDEX = 1
const BUS_NAME = "voz"
const EFFECT_INDEX = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pitch = Globales.config.velocidad_voz
	audio = AudioStreamPlayer.new()
	var shift = AudioEffectPitchShift.new()
	shift.pitch_scale = 1.0 / pitch
	AudioServer.add_bus(BUS_INDEX)
	AudioServer.set_bus_name(BUS_INDEX, BUS_NAME)
	AudioServer.add_bus_effect(BUS_INDEX, shift, EFFECT_INDEX)
	audio.bus = BUS_NAME
	audio.pitch_scale = pitch
	
func voice_speed(speed):
	pitch = speed
	Globales.config.velocidad_voz = pitch
	Globales.save()
	audio.pitch_scale = pitch
	var shift = AudioServer.get_bus_effect(BUS_INDEX, EFFECT_INDEX)
	shift.pitch_scale = 1.0 / pitch

func play_voice(resource):
	if not Globales.config.voz_encendida: return
	var voice = load(resource)
	voice.set_loop(false)
	audio.stream = voice
	audio.play()
	add_child(audio)
	audio.volume_db = Globales.config.volumen_voz

func voice_playing():
	return audio.is_playing()

func toggle_voice():
	if Globales.config.voz_encendida:
		Globales.config.voz_encendida = false
		audio.stop()
	else:
		Globales.config.voz_encendida = true
		emit_signal("voice_activated")
	Globales.save()

func stop_voice():
	audio.stop()
		
func changeVolume(value):
	audio.volume_db = value
	Globales.config.volumen_voz = audio.volume_db	
	Globales.save()	
	if value == -24 and Globales.config.voz_encendida or value == -23 and not Globales.config.voz_encendida:
		toggle_voice()
	
func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_M: #MUTE
			toggle_voice()
		elif event.scancode == KEY_R: #RESTART
			audio.stop()
			emit_signal("voice_activated")
		elif event.scancode == KEY_S: #STOP
			audio.stop()
