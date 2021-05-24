extends Node


# Declare member variables here. Examples:
# var a = 2
var b
var p = Vector2(0, 0)
var barriles #barriles creados
var b_dest #barriles destruidos


# Called when the node enters the scene tree for the first time.
func _ready():
	b = 0
	barriles = 0
	b_dest = -1


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
