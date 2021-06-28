extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	VoiceConfiguration.connect("voice_activated", self, "scene_voice")
	scene_voice()
	
	
func _input(event):
	if event is InputEventKey and event.pressed and event.scancode != KEY_M and event.scancode != KEY_R and event.scancode != KEY_S:
		$SelectionSound.play()

func _on_CualquierTeclaLabel_mouse_entered():
	$VBoxContainer/CualquierTeclaLabel.add_color_override("font_color", Color(1,0,0))


func _on_CualquierTeclaLabel_mouse_exited():
	$VBoxContainer/CualquierTeclaLabel.add_color_override("font_color", Color(1,1,1))


func _on_CualquierTeclaLabel_gui_input(event):
	if (event is InputEventMouseButton && event.pressed && event.button_index == BUTTON_LEFT):
		$SelectionSound.play()


func _on_SelectionSound_finished():
	VoiceConfiguration.stop_voice()
	get_tree().change_scene("res://scenes/MainMenu.tscn")


func _on_SilenciarVozLabel_mouse_entered():
	$VBoxContainer/SilenciarVozLabel.add_color_override("font_color", Color(1,0,0))


func _on_SilenciarVozLabel_mouse_exited():
	$VBoxContainer/SilenciarVozLabel.add_color_override("font_color", Color(1,1,1))


func _on_SilenciarVozLabel_gui_input(event):
	if (event is InputEventMouseButton && event.pressed && event.button_index == BUTTON_LEFT):
		VoiceConfiguration.toggle_voice()

func scene_voice():
	print("llega")
	$"/root/VoiceConfiguration".play_voice("res://resources/voices/InitialScene/initial_scene_voice.ogg")
