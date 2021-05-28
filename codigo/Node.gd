extends Node

export (PackedScene) var sce_game

# Called when the node enters the scene tree for the first time.
func _ready():
	pass 

#Cuando el botón es presionado se reproduce un sonido inicial
#y se cambia a la escena del juego
func _on_Button_pressed():
	$Intro.play()
	get_tree().change_scene("res://Game.tscn")
