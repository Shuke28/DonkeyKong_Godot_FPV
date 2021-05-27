extends Area2D
#La princesa siempre estará en movimiento desde el inicio
func _ready():
	$AnimationPlayer.play("movimiento")
#Si la princesa detecta a Mario en su CollisionShape2d, aumenta el
#contador de juegos ganados, el valor que Mario ganó es true y
#la muerte de Donkey Kong es true
func _on_Princesa_body_entered(body):
	if body.name == "Mario":
		VariablesGlobales.gano += 1
		VariablesGlobales.g_b = true
		VariablesGlobales.donkey_die = true
