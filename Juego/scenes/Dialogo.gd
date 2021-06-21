extends AcceptDialog

signal fin_pausa;
func _ready():
	var ok_button = get_ok()
	var close_button = get_close_button()
	
	close_button.visible = false
	ok_button.text = "   Entendido   "
	


func _on_Dialogo_confirmed():
	emit_signal("fin_pausa")
