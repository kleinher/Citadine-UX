extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("5_selection"):
			$SelectionSoud.play()

func _on_IrAlMenuButton_pressed():
	get_tree().change_scene("res://scenes/MainMenu.tscn")


func _on_SelectionSoud_finished():
	get_tree().change_scene("res://scenes/MainMenu.tscn")
