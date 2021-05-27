extends Node

var b #Marcador que nos dice cuando hay un martillo en la escena
var p = Vector2(0, 0)
var barriles #barriles creados
var b_dest #barriles destruidos
var vida_mario #Contabilidad de las vidas de mario
var vidas #Marcadores que nos dirá si Mario murió
var tiempo_juego = 180 #Tiempo que tiene mario para ganar la partida
var gano = 0 #Contador de juegos ganados en una sesión 
var g_b = false #Marcador para avisarnos si Mario ganó una partida

# Called when the node enters the scene tree for the first time.
func _ready():
	b = 0
	barriles = 0
	b_dest = -1
	vida_mario = true
	vidas = 3
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
