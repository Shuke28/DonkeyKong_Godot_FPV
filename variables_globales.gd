extends Node


# Declare member variables here. Examples:
# var a = 2
var b
var p = Vector2(0, 0)
var barriles #barriles creados
var b_dest #barriles destruidos
var vida_mario
var vidas
var tiempo_juego = 180
var gano = 0
var g_b = false
var donkey_die = false

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
