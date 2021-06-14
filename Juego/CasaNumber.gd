extends HBoxContainer

var contador = 0
func _ready():
	$Counter/Background/Number.text = str(contador)

func incrementarValor():
	contador+=1
	$Counter/Background/Number.text = str(contador)
