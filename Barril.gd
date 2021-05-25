extends RigidBody2D

export (PackedScene) var Martillo
signal golpe
# Called when the node enters the scene tree for the first time.
func _ready():
	#Desactiva el CollisionShape2d, estado predeterminado
	$CollisionShape2D.disabled = false
	apply_impulse(Vector2(200, 0), Vector2(200, 0))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(get_colliding_bodies())
	if linear_velocity.x < 0:
		apply_impulse(Vector2(-100, 80), Vector2(-100, 80))

func _integrate_forces(state):
	for i in range(state.get_contact_count()):
		if(state.get_contact_collider_object(i).is_in_group("Martillos")):
			VariablesGlobales.b_dest += 1
			$HammerSmash.play()
			queue_free()
		if(state.get_contact_collider_object(i).is_in_group("Player")):
			#print("GameOver")
			emit_signal("golpe")
			#Activa el CollisionShape2d
			$CollisionShape2D.disabled = true
