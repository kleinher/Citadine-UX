extends Control


# Declare member variables here. Examples:
var saliendo = false # Uso esta variable para poder reproducir el SelectionSound antes de salir
var a_config = false


# Called when the node enters the scene tree for the first time.
func _ready():
	set_font_sizes()


func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("1_selection"):
			pass # TODO: escena del juego
		elif event.is_action_pressed("2_selection"):
			a_config = true
			$SelectionSound.play()
		elif event.is_action_pressed("4_selection"):
			saliendo = true
			$SelectionSound.play()


func _on_SalirButton_button_up():
	$SelectionSound.play()
	saliendo = true



func _on_SelectionSound_finished():
	if saliendo: get_tree().quit()
	elif a_config: get_tree().change_scene("res://scenes/ConfigurationScene.tscn")


func _on_ConfigurarButton_pressed():
	a_config = true
	$SelectionSound.play()

func _on_IniciarJuegoButton_pressed():
	get_tree().change_scene("res://Mapa.tscn")
	
func set_font_sizes():
	$VBoxContainer/VBoxContainer/MenuTitle.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_titulo_size())
	$VBoxContainer/VBoxContainer/CenterContainer/IniciarJuegoButton.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())
	$VBoxContainer/VBoxContainer/CenterContainer2/ConfigurarButton.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())
	$VBoxContainer/CenterContainer/SalirButton.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())
