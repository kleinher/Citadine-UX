extends Control


var a_accesibilidad = false
var set_tamanio = false


# Called when the node enters the scene tree for the first time.
func _ready():
	set_font_sizes()
	VoiceConfiguration.connect("voice_activated", self, "scene_voice")
	scene_voice()

func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("1_selection"):
			TamanioLetrasConfig.set_tamanio_letras(2)
			VoiceConfiguration.play_voice("res://resources/voices/FontSize/small.ogg")
			set_tamanio = true
			$SelectionSound.play()
		elif event.is_action_pressed("2_selection"):
			TamanioLetrasConfig.set_tamanio_letras(1)
			VoiceConfiguration.play_voice("res://resources/voices/FontSize/medium.ogg")
			set_tamanio = true
			$SelectionSound.play()
		elif event.is_action_pressed("3_selection"):
			TamanioLetrasConfig.set_tamanio_letras(0)
			VoiceConfiguration.play_voice("res://resources/voices/FontSize/big.ogg")
			set_tamanio = true
			$SelectionSound.play()
		elif event.is_action_pressed("4_selection"):
			a_accesibilidad = true
			$SelectionSound.play()


func _on_VolverAAccesibilidadButton_pressed():
	a_accesibilidad = true
	$SelectionSound.play()


func _on_SelectionSound_finished():
	if a_accesibilidad: get_tree().change_scene("res://scenes/AccesibilidadScene.tscn")
	else: set_font_sizes()


func _on_PequeaButton_pressed():
	TamanioLetrasConfig.set_tamanio_letras(2)
	VoiceConfiguration.play_voice("res://resources/voices/FontSize/small.ogg")
	set_tamanio = true
	$SelectionSound.play()


func _on_MedianoButton_pressed():
	TamanioLetrasConfig.set_tamanio_letras(1)
	VoiceConfiguration.play_voice("res://resources/voices/FontSize/medium.ogg")
	set_tamanio = true
	$SelectionSound.play()


func _on_GrandeButton_pressed():
	TamanioLetrasConfig.set_tamanio_letras(0)
	VoiceConfiguration.play_voice("res://resources/voices/FontSize/big.ogg")
	set_tamanio = true
	$SelectionSound.play()
	
func set_font_sizes():
	$"VBoxContainer/VBoxContainer/TamañoLetrasTitle".get("custom_fonts/font").set_size(TamanioLetrasConfig.get_titulo_size())
	$"VBoxContainer/VBoxContainer/CenterContainer/PequeñaButton".get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())
	$VBoxContainer/VBoxContainer/CenterContainer2/MedianoButton.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())
	$VBoxContainer/VBoxContainer/CenterContainer3/GrandeButton
	$IrAlMenuScene/IrAlMenuButton.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())

func scene_voice():
	$"/root/VoiceConfiguration".play_voice("res://resources/voices/FontSize/font_size_voice.ogg")
