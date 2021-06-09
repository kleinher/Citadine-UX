extends Control


# Declare member variables here. Examples:
var a_config = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("1_selection"):
			pass
		elif event.is_action_pressed("2_selection"):
			pass
		elif event.is_action_pressed("3_selection"):
			pass 
		elif event.is_action_pressed("4_selection"):
			a_config = true
			$SelectionSound.play()


func _on_BigButton_pressed():
	pass # Replace with function body.


func _on_MediumButton_pressed():
	pass # Replace with function body.


func _on_SmallButton_pressed():
	pass # Replace with function body.


func _on_VolverAlMenuButton_pressed():
	a_config = true
	$SelectionSound.play()
	
func _on_SelectionSound_finished():
	if a_config: get_tree().change_scene("res://scenes/ConfigurationScene.tscn")
