extends Timer

var nubeEscena = preload("res://scenes/Nube.tscn")

func _ready():
	_on_NubeTimer_timeout()
	
func _on_NubeTimer_timeout():
	var aux = nubeEscena.instance()
	aux.velocity = rand_range(0.1, 0.2)
	get_parent().add_child(aux)
	start(rand_range(3, 6))
