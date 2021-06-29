extends Control


var a_accesibilidad = false

# Called when the node enters the scene tree for the first time.
func _ready():
	set_font_sizes()
	VoiceConfiguration.connect("voice_activated", self, "scene_voice")
	scene_voice()
	$VBoxContainer/VBoxContainer/HBoxContainer/VelocidadBar.value = Globales.config.velocidad_voz
	$VBoxContainer/VBoxContainer/HBoxContainer2/VolumenBar.value = Globales.config.volumen_voz
	$VBoxContainer/VBoxContainer/EncendidaCheck.pressed = Globales.config.voz_encendida

func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("4_selection"):
			a_accesibilidad = true
			$SelectionSound.play()
		elif event.is_action_pressed("ui_up"):
			$VBoxContainer/VBoxContainer/HBoxContainer/VelocidadBar.value += 0.1
			if $VBoxContainer/VBoxContainer/HBoxContainer/VelocidadBar.value == 2.5:
				VoiceConfiguration.play_voice("res://resources/voices/VoiceConfiguration/velocidad_maxima.ogg")
			elif not VoiceConfiguration.voice_playing():
				VoiceConfiguration.play_voice("res://resources/voices/VoiceConfiguration/velocidad.ogg")
		elif event.is_action_pressed("ui_down"):
			$VBoxContainer/VBoxContainer/HBoxContainer/VelocidadBar.value -= 0.1
			if not VoiceConfiguration.voice_playing():
				VoiceConfiguration.play_voice("res://resources/voices/VoiceConfiguration/velocidad.ogg")
		elif event.is_action_pressed("ui_right"):
			$VBoxContainer/VBoxContainer/HBoxContainer2/VolumenBar.value += 1
			if $VBoxContainer/VBoxContainer/HBoxContainer2/VolumenBar.value == 0:
				VoiceConfiguration.play_voice("res://resources/voices/VoiceConfiguration/volumen_maximo.ogg")
			elif not VoiceConfiguration.voice_playing():
				VoiceConfiguration.play_voice("res://resources/voices/VoiceConfiguration/volumen.ogg")
		elif event.is_action_pressed("ui_left"):
			$VBoxContainer/VBoxContainer/HBoxContainer2/VolumenBar.value -= 1
			if not VoiceConfiguration.voice_playing():
				VoiceConfiguration.play_voice("res://resources/voices/VoiceConfiguration/volumen.ogg")
		elif event.scancode == KEY_M:
			$VBoxContainer/VBoxContainer/EncendidaCheck.pressed = Globales.config.voz_encendida


func _on_VolverAAccesibilidadButton_pressed():
	a_accesibilidad = true
	$SelectionSound.play()


func _on_SelectionSound_finished():
	if a_accesibilidad: get_tree().change_scene("res://scenes/AccesibilidadScene.tscn")

func set_font_sizes():
	$VBoxContainer/VBoxContainer/VozTitle.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_titulo_size())
	$VBoxContainer/VBoxContainer/HBoxContainer/VelocidadLabel.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())
	$VBoxContainer/VBoxContainer/HBoxContainer2/VolumenLabel.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())
	$VBoxContainer/VBoxContainer/EncendidaCheck.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())
	$IrAlMenuScene/IrAlMenuButton.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())
	$VBoxContainer/CenterContainer/VolverAAccesibilidadButton.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())
	


func _on_VelocidadBar_value_changed(value):
	VoiceConfiguration.voice_speed(value)


func _on_VolumenBar_value_changed(value):
	VoiceConfiguration.changeVolume(value)

func scene_voice():
	$"/root/VoiceConfiguration".play_voice("res://resources/voices/VoiceConfiguration/voice_configuration_voice.ogg")


func _on_EncendidaCheck_pressed():
	VoiceConfiguration.toggle_voice()
