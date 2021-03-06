extends Control


# Declare member variables here. Examples:
var a_menu = false
var a_resolucion = false
var a_accesibilidad = false
var a_sonido = false


# Called when the node enters the scene tree for the first time.
func _ready():
	set_font_sizes()
	VoiceConfiguration.connect("voice_activated", self, "scene_voice")
	scene_voice()


func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("1_selection"):
			a_sonido = true
			$SelectionSound.play()
		elif event.is_action_pressed("2_selection"):
			a_resolucion = true
			$SelectionSound.play()
		elif event.is_action_pressed("3_selection"):
			a_accesibilidad = true
			$SelectionSound.play()
		elif event.is_action_pressed("4_selection"):
			a_menu = true
			$SelectionSound.play()


func _on_VolverAlMenuButton_pressed():
	a_menu = true
	$SelectionSound.play()


func _on_SelectionSound_finished():
	VoiceConfiguration.stop_voice()
	if a_menu: get_tree().change_scene("res://scenes/MainMenu.tscn")
	elif a_resolucion: get_tree().change_scene("res://scenes/ResolucionScene.tscn")
	elif a_accesibilidad: get_tree().change_scene("res://scenes/AccesibilidadScene.tscn")
	elif a_sonido: get_tree().change_scene("res://scenes/SoudScene.tscn")


func _on_ResolucionButton_pressed():
	a_resolucion = true
	$SelectionSound.play()


func _on_AccesibilidadButton_pressed():
	a_accesibilidad = true
	$SelectionSound.play()
	
func set_font_sizes():
	$VBoxContainer/VBoxContainer/ConfigurationTitle.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_titulo_size())
	$VBoxContainer/VBoxContainer/CenterContainer/SonidoButton.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())
	$VBoxContainer/VBoxContainer/CenterContainer2/ResolucionButton.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())
	$VBoxContainer/VBoxContainer/CenterContainer3/AccesibilidadButton.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())
	$VBoxContainer/CenterContainer/VolverAlMenuButton.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())


func _on_SonidoButton_pressed():
	a_sonido = true
	$SelectionSound.play()

func scene_voice():
	$"/root/VoiceConfiguration".play_voice("res://resources/voices/Configuration/configuration_voice.ogg")
