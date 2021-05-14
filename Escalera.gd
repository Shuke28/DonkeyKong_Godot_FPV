extends Area2D

func _ready():
	pass


func _on_Escalera_body_entered(body):
	if body.name == "Mario":
		get_node("../Mario").on_ladder = true

func _on_Escalera_body_exited(body):
	if body.name == "Mario":
		get_node("../Mario").on_ladder = false
