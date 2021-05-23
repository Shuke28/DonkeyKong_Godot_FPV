extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (PackedScene) var sce_game

# Called when the node enters the scene tree for the first time.
func _ready():
	pass 


func _on_Button_pressed():
	get_tree().change_scene("res://Game.tscn")
