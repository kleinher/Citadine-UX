extends TextureProgress

signal poco_tiempo
var magnitud_decrementar = 1
func _process(delta):
	if(value <= 20):
		emit_signal("poco_tiempo")


func _on_Tiempo_decrementar_barra_timeout():
	value -= magnitud_decrementar
