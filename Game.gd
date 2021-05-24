extends Node2D

func _ready():
	$SonidoFondo.play()
	
func _process(delta):
	$Label.text = "Barriles creados: " + str(VariablesGlobales.barriles) + "	Barriles destruidos: " + str(VariablesGlobales.b_dest)
