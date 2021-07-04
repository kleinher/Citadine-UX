extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var dialog=["Inicialmente la ciudad está construida con ciertos problemas que imposibilitan la filtración del agua de lluvia y causan inundaciones. Por ejemplo, hay pocos espacios verdes,hay estacionamientos de asfalto o no hay tachos de basura. El jugador deberá decidir qué aspectos cambiar de la ciudad para mejorar la posibilidad de filtración del agua. Entre las posibilidades disponibles, el jugador puede plantar árboles, ubicar tachos de basura o reemplazar estacionamientos por espacios verdes (opciones beneficiosas) o construir casas, talar árboles y construir estacionamientos (opciones perjudiciales). Dependiendo de las decisiones del jugador, la ciudad se inundará o no con la próxima lluvia"]

var dialog_index=0
var text_speed=0.1
var a_start = false
var saliendo = false

func _ready():
	$RichTextLabel.bbcode_text=''
	_loadDialog()

func _loadDialog():
	if dialog_index < dialog.size():
		$RichTextLabel.bbcode_text=dialog[dialog_index]
		$RichTextLabel.percent_visible=0
		var tween_duration=text_speed * dialog[dialog_index].length()
		$Tween.interpolate_property($RichTextLabel,"percent_visible",0,1,tween_duration,Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)     
		$Tween.start()
	dialog_index+=1


func _on_Iniciar_pressed():
	a_start = true
	$SelectionSound.play()

func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("1_selection"):
			a_start = true
			$SelectionSound.play()
		elif event.is_action_pressed("4_selection"):
			saliendo = true
			$SelectionSound.play()
			
func _on_SelectionSound_finished():
	VoiceConfiguration.stop_voice()
	if saliendo: get_tree().quit()
	elif a_start: get_tree().change_scene("res://scenes/InitialScene.tscn")

func _on_Salir_pressed():
	$SelectionSound.play()
	saliendo = true
