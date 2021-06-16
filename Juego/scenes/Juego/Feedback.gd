extends AudioStreamPlayer2D

var feedbackScene = preload("res://coinFeedback.tscn")
var CorrectSound = preload("res://resources/sonidos/snd_coin.wav")

func coinFeedback(currentTile,currentTilePosition):
	var aux = feedbackScene.instance()
	aux.position = Vector2(currentTilePosition.x,currentTilePosition.y-20)
	stream = CorrectSound
	play()
	get_parent().add_child(aux)
