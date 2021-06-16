extends Node


var tiempo_Inicio = 100
var frecuencia = 1
	
func _on_Timer_timeout():
	$tick.play()
	$Timer.start(frecuencia)
	
func _on_Gauge_poco_tiempo():
		frecuencia = 0.3
