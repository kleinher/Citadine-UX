extends Node2D

export var y_speed = 0.3
export var alpha_speed = 0.01
func _process(delta):
	position.y-= y_speed
	modulate.a -= alpha_speed 
	if(modulate.a == 0):
		self.queue_free()
	


