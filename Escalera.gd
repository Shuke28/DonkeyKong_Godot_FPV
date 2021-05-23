extends Area2D

# ca
func _ready():
	pass # Replace with function body.

func _on_esc_body_entered(body):
	if body.name == "Mario":
		get_node("../Mario").on_ladder = true


func _on_esc_body_exited(body):
	if body.name == "Mario":
		get_node("../Mario").on_ladder = false
