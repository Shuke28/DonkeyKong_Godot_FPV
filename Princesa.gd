extends Area2D

func _ready():
	$AnimationPlayer.play("movimiento")


func _on_Princesa_body_entered(body):
	if body.name == "Mario":
		VariablesGlobales.gano += 1
		VariablesGlobales.g_b = true
		VariablesGlobales.donkey_die = true
