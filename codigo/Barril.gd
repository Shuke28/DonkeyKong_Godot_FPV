extends RigidBody2D

export (PackedScene) var Martillo
signal golpe

func _ready():
	#Desactiva el CollisionShape2d, estado predeterminado
	$CollisionShape2D.disabled = false
	#Se aplica un impulso a los barriles al aparecer
	apply_impulse(Vector2(200, 0), Vector2(200, 0))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(get_colliding_bodies())
	if linear_velocity.x < 0:
		apply_impulse(Vector2(-100, 80), Vector2(-100, 80))

#Esta función detecta las colisiones con el barril
# ya sea para Martillos o el Player
func _integrate_forces(state):
	#El ciclo for recorre todas las colisiones del barril mientras rueda
	for i in range(state.get_contact_count()):
		#Detecta si hay colision con el grupo Martillos
		if(state.get_contact_collider_object(i).is_in_group("Martillos")):
			VariablesGlobales.b_dest += 1
			$HammerSmash.play()
			queue_free() #Se elimina el barril y libera espacio
		#Detecta si hay colision con el grupo Player
		elif (state.get_contact_collider_object(i).is_in_group("Player")):
			VariablesGlobales.vida_mario = false 
			queue_free() #Se elimina el barril y libera espacio
			VariablesGlobales.barriles -= 1 #Se aumenta el contado
			emit_signal("golpe")#Envía una señal de golpe para los demás nodos
			$CollisionShape2D.disabled = true #Activa el CollisionShape2d
