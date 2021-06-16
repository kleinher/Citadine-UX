extends Timer

var nubeEscena = preload("res://scenes/Nube.tscn")

func _on_NubeTimer_timeout():
	var aux = nubeEscena.instance()
	get_parent().add_child(aux)
