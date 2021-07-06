extends Control

var tamanio_texto = [32, 22, 12]

# Called when the node enters the scene tree for the first time.
func _ready():
	VoiceConfiguration.connect("voice_activated", self, "scene_voice")
	scene_voice()
	set_font_sizes()

func scene_voice():
	$"/root/VoiceConfiguration".play_voice("res://resources/voices/ComoJugarScene/como_jugar_scene_voice.ogg")

func set_font_sizes():
	$VBoxContainer/ComoJugarTitle.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_titulo_size())
	var separation = 30
	if TamanioLetrasConfig.get_titulo_size() <= 42:
		separation += 35
	if TamanioLetrasConfig.get_titulo_size() == 22:
		separation += 70
	$VBoxContainer.add_constant_override("separation", separation)
	$VBoxContainer/HBoxContainer/ObjetivoVbox/ObjetivoLabel.get("custom_fonts/font").set_size(tamanio_texto[TamanioLetrasConfig.tamanio_letras])
	#$VBoxContainer/HBoxContainer/ObjetivoVbox/ObjetivoLabel2.get("custom_fonts/font").set_size(22)#)
	$VBoxContainer/HBoxContainer/ControlesVbox/ControlesLabel.get("custom_fonts/font").set_size(tamanio_texto[TamanioLetrasConfig.tamanio_letras])
	$VBoxContainer/HBoxContainer/ControlesVbox/ControlesLabel2.get("custom_fonts/font").set_size(tamanio_texto[TamanioLetrasConfig.tamanio_letras])
	$IrAlMenuScene/IrAlMenuButton.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())
