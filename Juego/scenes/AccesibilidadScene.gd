extends Control


var a_config = false
var a_tamano_letras = false
var a_voz = false

func _ready():
	set_font_sizes()
	VoiceConfiguration.connect("voice_activated", self, "scene_voice")
	scene_voice()

func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("1_selection"):
			a_tamano_letras = true
			$SelectionSound.play()
		elif event.is_action_pressed("2_selection"):
			a_voz = true
			$SelectionSound.play()
		elif event.is_action_pressed("4_selection"):
			a_config = true
			$SelectionSound.play()



func _on_SelectionSound_finished():
	VoiceConfiguration.stop_voice()
	if a_config: get_tree().change_scene("res://scenes/ConfigurationScene.tscn")
	if a_tamano_letras: get_tree().change_scene("res://scenes/TamañoLetrasScene.tscn")
	if a_voz: get_tree().change_scene("res://scenes/VozScene.tscn")


func _on_TamaoLetrasButton_pressed():
	a_tamano_letras = true
	$SelectionSound.play()


func _on_VozButton_pressed():
	a_voz = true
	$SelectionSound.play()


func _on_VolverAConfigButton_pressed():
	a_config = true
	$SelectionSound.play()

func set_font_sizes():
	$VBoxContainer/VBoxContainer/AccesibilidadTitle.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_titulo_size())
	$"VBoxContainer/VBoxContainer/CenterContainer/TamañoLetrasButton".get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())
	$VBoxContainer/VBoxContainer/CenterContainer2/VozButton.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())
	$VBoxContainer/CenterContainer/VolverAConfigButton.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())
	$IrAlMenuScene/IrAlMenuButton.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())

func scene_voice():
	$"/root/VoiceConfiguration".play_voice("res://resources/voices/Accesibility/accesibility_voice.ogg")
