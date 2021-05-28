extends Node

<<<<<<< HEAD
var b #Marcador que nos dice cuando hay un martillo en la escena
var p = Vector2(0, 0)
var barriles #barriles creados
var b_dest #barriles destruidos
var vida_mario #Contabilidad de las vidas de mario
var vidas #Marcadores que nos dirá si Mario murió
var tiempo_juego = 180 #Tiempo que tiene mario para ganar la partida
var gano = 0 #Contador de juegos ganados en una sesión 
var g_b = false #Marcador para avisarnos si Mario ganó una partida
=======
#Variables globales para usar en todos los scripts del juego
#y tener un mejor control

var b #Control de martillos
var p = Vector2(0, 0) #Vector global de posición para Mario
var barriles #Barriles creados
var b_dest #Barriles destruidos
var vida_mario #Si Mario permanece vivo
var vidas #Totales de vidas de Mario
var tiempo_juego = 180 #Tiempo con el que inicia el juego
var gano = 0 #Contador de juegos ganados
var g_b = false #El valor de Mario ganador es false
var donkey_die = false #La muerte de Donkey Kong es false
>>>>>>> master

#Los valores con los que se inica el juego
func _ready():
	b = 0
	barriles = 0
	b_dest = -1
	vida_mario = true
	vidas = 3
