extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event is InputEventKey and event.pressed:
		$SelectionSound.play()
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_CualquierTeclaLabel_mouse_entered():
	$VBoxContainer/CualquierTeclaLabel.add_color_override("font_color", Color(1,0,0))


func _on_CualquierTeclaLabel_mouse_exited():
	$VBoxContainer/CualquierTeclaLabel.add_color_override("font_color", Color(1,1,1))


func _on_CualquierTeclaLabel_gui_input(event):
	if (event is InputEventMouseButton && event.pressed && event.button_index == BUTTON_LEFT):
		$SelectionSound.play()


func _on_SelectionSound_finished():
	get_tree().change_scene("res://scenes/MainMenu.tscn")