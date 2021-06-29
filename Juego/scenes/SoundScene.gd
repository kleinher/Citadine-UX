extends Control


var a_menu_configuration = false
var volume=0
var min_vol
var music_position = 0.0

func _ready():
	#Setea el valor de la barra de volumen, con la ultima configuracion
	find_node("Music").value=Globales.config.sonido
	VoiceConfiguration.connect("voice_activated", self, "scene_voice")
	scene_voice()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("ui_up"):
			$VBoxContainer/VBoxContainer/HBoxContainer/Music.value += 1
		elif event.is_action_pressed("ui_down"):
			$VBoxContainer/VBoxContainer/HBoxContainer/Music.value -= 1
		elif event.is_action_pressed("4_selection"):
			a_menu_configuration = true
			$SelectionSound.play()


func _on_VolverAlMenuButton_pressed():
	a_menu_configuration = true
	$SelectionSound.play()

func _on_SelectionSound_finished():
	if a_menu_configuration: get_tree().change_scene("res://scenes/ConfigurationScene.tscn")

func _on_volumen_value_changed(value):	
	print("Music changed. Level: %d" % value)
	SoundConfiguration.changeVolume(value)
	
func scene_voice():
	$"/root/VoiceConfiguration".play_voice("res://resources/voices/SoundConfiguration/sound_configuration_voice.ogg")


