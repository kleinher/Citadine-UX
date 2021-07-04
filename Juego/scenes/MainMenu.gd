extends Control


# Declare member variables here. Examples:
var saliendo = false # Uso esta variable para poder reproducir el SelectionSound antes de salir
var a_config = false
var a_play = false
var a_dificultad = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	set_font_sizes()
	VoiceConfiguration.connect("voice_activated", self, "scene_voice")
	scene_voice()


func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("1_selection"):
			a_play = true
			$SelectionSound.play()
		elif event.is_action_pressed("2_selection"):
			a_config = true
			$SelectionSound.play()
		elif event.is_action_pressed("3_selection"):
			a_dificultad = true
			$SelectionSound.play()
		elif event.is_action_pressed("4_selection"):
			saliendo = true
			$SelectionSound.play()


func _on_SalirButton_button_up():
	$SelectionSound.play()
	saliendo = true



func _on_SelectionSound_finished():
	VoiceConfiguration.stop_voice()
	if saliendo: get_tree().quit()
	elif a_config: get_tree().change_scene("res://scenes/ConfigurationScene.tscn")
	elif a_play: get_tree().change_scene("res://scenes/Juego.tscn")
	elif a_dificultad: get_tree().change_scene("res://scenes/DificultadScene.tscn")
	


func _on_ConfigurarButton_pressed():
	a_config = true
	$SelectionSound.play()

func _on_IniciarJuegoButton_pressed():
	a_play = true
	$SelectionSound.play()
	
func set_font_sizes():
	$VBoxContainer2/MenuTitle.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_titulo_size())
	$VBoxContainer2/CenterContainer/IniciarJuegoButton.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())
	$VBoxContainer2/CenterContainer2/ConfigurarButton.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())
	$VBoxContainer2/CenterContainer4/SalirButton.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())
	$VBoxContainer2/CenterContainer3/DificultadButton.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())

func _on_DificultadButton_pressed():
	a_dificultad = true
	$SelectionSound.play()

func scene_voice():
	$"/root/VoiceConfiguration".play_voice("res://resources/voices/MainMenu/main_menu_voice.ogg")
