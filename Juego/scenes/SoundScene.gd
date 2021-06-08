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
	$AudioStreamPlayer.play()
	music_position = 0.0
	min_vol = find_node("Music").get_min()
	find_node("Music").set_min(min_vol)

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
	volume=value	
	if _music_is_on():
		print("Music changed. Level: %d" % volume)
		_music("SUBIR")
	else:
		_music("BAJAR")
		
	
func _music_is_on():
	return volume > min_vol
		
func _music(action):
	if action == "SUBIR":
		$AudioStreamPlayer.volume_db = volume
		if !$AudioStreamPlayer.is_playing():
			$AudioStreamPlayer.play(music_position)
		print("Music changed")
	else:
		music_position = $AudioStreamPlayer.get_playback_position()
		$AudioStreamPlayer.stop()
		print("Music stopped")



