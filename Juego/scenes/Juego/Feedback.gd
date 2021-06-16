extends Node2D

var feedbackScene = preload("res://coinFeedback.tscn")

func coinFeedback(currentTile,currentTilePosition):
	var aux = feedbackScene.instance()
	aux.position = Vector2(currentTilePosition.x,currentTilePosition.y-20)
	$FeedbackCoin.play()
	get_parent().add_child(aux)
