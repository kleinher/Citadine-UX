extends AcceptDialog


func _ready():
	var ok_button = get_ok()
	var close_button = get_close_button()
	close_button.visible = false;
	ok_button.text = "   Entendido   "
