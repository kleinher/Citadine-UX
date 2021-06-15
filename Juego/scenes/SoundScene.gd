extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var a_menu_configuration = false
var volume=0
var min_vol
var music_position = 0.0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("4_selection"):
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
	



