extends HBoxContainer

var contador = 10
func _ready():
	$Counter/Background/Number.text = str(contador)

func decrementarValor():
	contador-=1
	$Counter/Background/Number.text = str(contador)
