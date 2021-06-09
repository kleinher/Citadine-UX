extends Control


var a_config = false
var a_tamano_letras = false
var a_contraste = false

func _ready():
	pass

func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("1_selection"):
			a_tamano_letras = true
			$SelectionSound.play()
		elif event.is_action_pressed("2_selection"):
			a_contraste = true
			$SelectionSound.play()
		elif event.is_action_pressed("4_selection"):
			a_config = true
			$SelectionSound.play()



func _on_SelectionSound_finished():
	if a_config: get_tree().change_scene("res://scenes/ConfigurationScene.tscn")
	if a_tamano_letras: get_tree().change_scene("res://scenes/TamañoLetrasScene.tscn")
	if a_contraste: get_tree().change_scene("res://scenes/ContrasteScene.tscn")


func _on_TamaoLetrasButton_pressed():
	a_tamano_letras = true
	$SelectionSound.play()


func _on_ContrasteButton_pressed():
	a_contraste = true
	$SelectionSound.play()


func _on_VolverAConfigButton_pressed():
	a_config = true
	$SelectionSound.play()
