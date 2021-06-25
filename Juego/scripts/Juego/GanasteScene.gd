extends Control

var a_menu = false
var salir_del_juego = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	set_font_sizes()


func set_font_sizes():
	$VBoxContainer/VBoxContainer/GanasteTitle.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_textos_size())
	$VBoxContainer/VBoxContainer/DatosLabel.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_textos_size() - 2)
	#Cambio la separación entre los elementos del VBox segun el tamaño de la letra
	var separation = TamanioLetrasConfig.get_textos_size()
	if separation <= 32:
		separation += 20
	if separation <= 52:
		separation += 20
	$VBoxContainer/VBoxContainer.add_constant_override("separation", separation)
	$VBoxContainer/CenterContainer2/HBoxContainer/IrAlMenuButton.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())
	$VBoxContainer/CenterContainer2/HBoxContainer/SiguienteNivelButton.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())
	$VBoxContainer/CenterContainer/SalirButton.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())
	

func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("1_selection"):
			a_menu = true
			$SelectionSound.play()
		elif event.is_action_pressed("2_selection"):
			pass
		elif event.is_action_pressed("4_selection"):
			salir_del_juego = true
			$SelectionSound.play()



func _on_IrAlMenuButton_pressed():
	a_menu = true
	$SelectionSound.play()
	
func _on_SalirButton_pressed():
	salir_del_juego = true
	$SelectionSound.play()
	
func _on_SiguienteNivelButton_pressed():
	get_parent().changeLevel()

func _on_SelectionSound_finished():
	if a_menu: get_tree().change_scene("res://scenes/MainMenu.tscn")
	elif salir_del_juego: get_tree().quit()





