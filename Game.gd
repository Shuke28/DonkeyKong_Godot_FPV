extends Node2D

onready var timer = get_node("Timer")

func _ready():
	$SonidoFondo.play()
	timer.set_wait_time(1)
	timer.start()
	
func _process(delta):
	$Label.text = "Barriles creados: " + str(VariablesGlobales.barriles) + "\nBarriles destruidos: " + str(VariablesGlobales.b_dest)
	$Label2.text = "Vidas: " + str(VariablesGlobales.vidas)
	$Label3.text = "Tiempo: " + str(VariablesGlobales.tiempo_juego)
	$Label4.text = "Ganados: " + str(VariablesGlobales.gano)

func _on_Barril_golpe():
	print("GameOver")


func Timer_out():
	VariablesGlobales.tiempo_juego -= 1
