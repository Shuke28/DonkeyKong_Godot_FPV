extends KinematicBody2D
#Controla el tiempo dentro del código
var t 

func _ready():
	t = 0

#Se encarga de instanciar barriles que aparecerán a
#un lado de Donkey Kong
func lanza_barril():
	var barril = load("res://Barril.tscn")
	var barr = barril.instance()
	barr.position = get_global_position() + Vector2(45, 0)
	get_parent().add_child(barr)

func _process(delta):
	t += 1
	#Donkey Kong realiza los lanzamientos de barriles cada 100 ciclos
	#transcurridos.
	if t > 100:
		if VariablesGlobales.barriles < 25:
			lanza_barril()
			t = 0
			VariablesGlobales.barriles += 1
	#Si ya lanzó todos los barriles, hace la animación de golpearse
	#el pecho
	if VariablesGlobales.barriles == 25:
		get_node("AnimationPlayer").play("golpe")
	#Si no, mantiene la animación de lanzar barriles
	else:
		$Sprite.flip_h = false
		get_node("AnimationPlayer").play("recogerAventar")
