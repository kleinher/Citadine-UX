extends Timer

var nube = preload("res://Nube.tscn")
var velocity = 0.3

func _on_Nubes_timeout():
	var aux = nube.instance()
	get_parent().add_child(aux)
	randomize()
	var pos = Vector2(-250,rand_range(100,500))
	aux.position = pos

	
