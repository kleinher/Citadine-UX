extends Control


# Declare member variables here. Examples:
var saliendo = false # Uso esta variable para poder reproducir el SelectionSound antes de salir


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("1_selection"):
			pass # TODO: Pasar a escena del juego
		elif event.is_action_pressed("2_selection"):
			pass # TODO: Pasar a escena de configuración
		elif event.is_action_pressed("4_selection"):
			$SelectionSound.play()
			saliendo = true


func _on_SalirButton_button_up():
	$SelectionSound.play()
	saliendo = true



func _on_SelectionSound_finished():
	if saliendo: get_tree().quit()
