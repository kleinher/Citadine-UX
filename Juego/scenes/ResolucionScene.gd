extends Control


# Declare member variables here. Examples:
var a_config = false
var big = false
var medium = false
var small = false


# Called when the node enters the scene tree for the first time.
func _ready():
	set_font_sizes()


func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("1_selection"):
			big = true
			$SelectionSound.play()
		elif event.is_action_pressed("2_selection"):
			medium = true
			$SelectionSound.play()
		elif event.is_action_pressed("3_selection"):
			small = true
			$SelectionSound.play()
		elif event.is_action_pressed("4_selection"):
			a_config = true
			$SelectionSound.play()


func _on_BigButton_pressed():
	big = true
	$SelectionSound.play()


func _on_MediumButton_pressed():
	medium = true
	$SelectionSound.play()


func _on_SmallButton_pressed():
	small = true
	$SelectionSound.play()


func _on_VolverAlMenuButton_pressed():
	a_config = true
	$SelectionSound.play()
	
func _on_SelectionSound_finished():
	if a_config: get_tree().change_scene("res://scenes/ConfigurationScene.tscn")
	elif big: 
		ResolutionConfig.change_window_size(Vector2(1920, 1080)) 
		big = false
	elif medium: 
		ResolutionConfig.change_window_size(Vector2(1080, 720))
		medium = false
	elif small: 
		ResolutionConfig.change_window_size(Vector2(800, 600))
		small = false

func set_font_sizes():
	$VBoxContainer/VBoxContainer/ResolucionTitle.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_titulo_size())
	$VBoxContainer/VBoxContainer/CenterContainer/BigButton.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())
	$VBoxContainer/VBoxContainer/CenterContainer2/MediumButton.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())
	$VBoxContainer/VBoxContainer/CenterContainer3/SmallButton.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())
	$VBoxContainer/CenterContainer/VolverAConfigButton.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())
	$IrAlMenuScene/IrAlMenuButton.get("custom_fonts/font").set_size(TamanioLetrasConfig.get_boton_size())
