extends Control


var a_accesibilidad = false

# Called when the node enters the scene tree for the first time.
func _ready():
	set_font_sizes()

func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("1_selection"):
			pass
		elif event.is_action_pressed("2_selection"):
			pass
		elif event.is_action_pressed("3_selection"):
			pass
		elif event.is_action_pressed("4_selection"):
			a_accesibilidad = true
			$SelectionSound.play()


func _on_VolverAAccesibilidadButton_pressed():
	a_accesibilidad = true
	$SelectionSound.play()


func _on_SelectionSound_finished():
	if a_accesibilidad: get_tree().change_scene("res://scenes/AccesibilidadScene.tscn")

func set_font_sizes():
	$VBoxContainer/VBoxContainer/ContrasteTitle.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_titulo_size())
	$VBoxContainer/VBoxContainer/CenterContainer/AltoButton.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())
	$VBoxContainer/VBoxContainer/CenterContainer2/MedioButton.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())
	$VBoxContainer/VBoxContainer/CenterContainer3/BajoButton.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())
	$VBoxContainer/CenterContainer/VolverAAccesibilidadButton.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())
	$IrAlMenuScene/IrAlMenuButton.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())
	
