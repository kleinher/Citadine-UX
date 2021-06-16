extends TextureProgress

signal poco_tiempo

func _process(delta):
	if(value <= 20):
		emit_signal("poco_tiempo")
