extends Control

func _ready():
	$Dialogo.popup_centered()
	pause_mode = Node.PAUSE_MODE_PROCESS


func _on_Dialogo_fin_pausa():
	get_parent().get_tree().paused = false
