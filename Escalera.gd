extends Area2D

func _ready():
	pass # Replace with function body.

#Las siguiente dos funciones permiten que Mario suba las
#escaleras, si se detecta el body name de Mario o no.

func _on_esc_body_entered(body):
	if body.name == "Mario":
		get_node("../Mario").on_ladder = true

func _on_esc_body_exited(body):
	if body.name == "Mario":
		get_node("../Mario").on_ladder = false
