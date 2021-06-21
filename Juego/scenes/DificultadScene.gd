extends Control

# Declare member variables here. Examples:
var a_menu = false
var facil = false
var normal = false
var dificil = false


# Called when the node enters the scene tree for the first time.
func _ready():
	set_font_sizes()

func _on_FacilButton_pressed():
	facil = true
	$SelectionSound.play()

func _on_NormalButton_pressed():
	normal = true
	$SelectionSound.play()

func _on_DificilButton_pressed():
	dificil = true
	$SelectionSound.play()

func _on_VolverAlMenu_pressed():
	a_menu = true
	$SelectionSound.play()


func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("1_selection"):
			facil = true
			$SelectionSound.play()
		elif event.is_action_pressed("2_selection"):
			normal = true
			$SelectionSound.play()
		elif event.is_action_pressed("3_selection"):
			dificil = true
			$SelectionSound.play()
		elif event.is_action_pressed("4_selection"):
			a_menu = true
			$SelectionSound.play()


	
func _on_SelectionSound_finished():
	if a_menu: get_tree().change_scene("res://scenes/MainMenu.tscn")
	elif facil: 
		DificultadConfig.set_dificultad(0)
		facil = false
	elif normal: 
		DificultadConfig.set_dificultad(1)
		normal = false
	elif dificil: 
		DificultadConfig.set_dificultad(2)
		dificil = false

func set_font_sizes():
	$VBoxContainer/VBoxContainer/DificultadTitle.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_titulo_size())
	$VBoxContainer/VBoxContainer/CenterContainer/FacilButton.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())
	$VBoxContainer/VBoxContainer/CenterContainer2/NormalButton.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())
	$VBoxContainer/VBoxContainer/CenterContainer3/DificilButton.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())
	$VBoxContainer/CenterContainer/VolverAlMenuButton.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())




