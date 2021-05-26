extends Node2D

func _ready():
	$SonidoFondo.play()
	
func _process(delta):
	$Label.text = "Barriles creados: " + str(VariablesGlobales.barriles) + "\nBarriles destruidos: " + str(VariablesGlobales.b_dest)


func _on_Barril_golpe():
	print("GameOver")
