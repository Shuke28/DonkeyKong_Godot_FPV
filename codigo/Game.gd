extends Node2D

onready var timer = get_node("Timer")

#Al iniciar el juego se reproduce la música de fondo
#e iniciar los timers
func _ready():
	$SonidoFondo.play()
	timer.set_wait_time(1)
	timer.start()

#Se mostrará el score y actualizará en todo momento
func _process(delta):
	$Label.text = "Barriles creados: " + str(VariablesGlobales.barriles) + "\nBarriles destruidos: " + str(VariablesGlobales.b_dest)
	$Label2.text = "Vidas: " + str(VariablesGlobales.vidas)
	$Label3.text = "Tiempo: " + str(VariablesGlobales.tiempo_juego)
	$Label4.text = "Ganados: " + str(VariablesGlobales.gano)

#Si el tiempo avanza se resta 1 al valor de tiempo en el score
func Timer_out():
	VariablesGlobales.tiempo_juego -= 1
