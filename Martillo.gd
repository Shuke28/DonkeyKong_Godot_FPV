extends KinematicBody2D

#	Se inicializan las variables para la trayectoria
#	de la bala
var velocidad = 5
var pos = Vector2()
var ang = 60
var g = 9.81
var t = 0
const up_direction = Vector2(0, -1)


func _ready():
	if VariablesGlobales.p.x < 0:
		ang = 120
	else:
		ang = 60

#	Función que nos da la posición instantánea de la bala
func get_pos(delta):
	t += delta
	pos = Vector2(velocidad * cos(ang * (PI /180)) * t, -(velocidad * sin(ang * (PI /180)) * t - 0.5 * g * t * t))


#	Se manda llamar la posición de la bala en el momento
func _physics_process(delta):
	get_pos(delta)
	pos = move_and_slide(pos, up_direction)
	$Sprite.rotate(sin(ang * (PI /180))*delta*2)
	# De pasar este límite, se libera la memoria.
	if is_on_floor():
		queue_free()
		VariablesGlobales.b = 0
	var collision = move_and_collide(pos)

