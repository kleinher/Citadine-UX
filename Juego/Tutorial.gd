extends Control

func _ready():
	$Dialogo.popup_centered()
	VoiceConfiguration.connect("voice_activated", self, "scene_voice")
	scene_voice()
	pause_mode = Node.PAUSE_MODE_PROCESS
	


func _on_Dialogo_fin_pausa():
	get_parent().get_tree().paused = false

func scene_voice():
	$"/root/VoiceConfiguration".play_voice("res://resources/voices/TutorialScene/tutorial_scene_voice.ogg")
