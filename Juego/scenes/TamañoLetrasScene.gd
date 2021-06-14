extends Control


var a_accesibilidad = false
var set_tamanio = false


# Called when the node enters the scene tree for the first time.
func _ready():
	set_font_sizes()

func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("1_selection"):
			TamanioLetrasConfig.tamanio_letras = 2
			set_tamanio = true
			$SelectionSound.play()
		elif event.is_action_pressed("2_selection"):
			TamanioLetrasConfig.tamanio_letras = 1
			set_tamanio = true
			$SelectionSound.play()
		elif event.is_action_pressed("3_selection"):
			TamanioLetrasConfig.tamanio_letras = 0
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
	TamanioLetrasConfig.tamanio_letras = 2
	set_tamanio = true
	$SelectionSound.play()


func _on_MedianoButton_pressed():
	TamanioLetrasConfig.tamanio_letras = 1
	set_tamanio = true
	$SelectionSound.play()


func _on_GrandeButton_pressed():
	TamanioLetrasConfig.tamanio_letras = 0
	set_tamanio = true
	$SelectionSound.play()
	
func set_font_sizes():
	$"VBoxContainer/VBoxContainer/TamañoLetrasTitle".get("custom_fonts/font").set_size(TamanioLetrasConfig.get_titulo_size())
	$"VBoxContainer/VBoxContainer/CenterContainer/PequeñaButton".get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())
	$VBoxContainer/VBoxContainer/CenterContainer2/MedianoButton.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())
	$VBoxContainer/VBoxContainer/CenterContainer3/GrandeButton
	$IrAlMenuScene/IrAlMenuButton.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())
