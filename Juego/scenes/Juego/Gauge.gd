extends TextureProgress

signal poco_tiempo
signal tiempo_finalizado

var magnitud_decrementar = DificultadConfig.get_time_from_dificultad()

func _ready():
	value = 200
	connect("tiempo_finalizado" , get_parent().get_parent().get_parent().get_parent().get_parent().get_parent(), "tiempoFinalizado")

func _process(delta):
	
	if(value <= 20):
		emit_signal("poco_tiempo")

func _on_Tiempo_decrementar_barra_timeout():
	value -= magnitud_decrementar
	if (value <= 0):
		emit_signal("tiempo_finalizado")
		value = 100
