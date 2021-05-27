extends KinematicBody2D

const ACELERATION = 50
const MAX_SPEED = 100
const JUMP_H = -280
const up_direction = Vector2(0, -1)
var gravity = 20 #Gravedad por default
var t = 0 #Variabla para controlar tiempo dentro de ciclos

var on_ladder = false
var motion = Vector2()

#Se reinician todos los valores cuando Mario pierde las tres vidas
#y cambia de escena a la de inicio
func reinicia():
	VariablesGlobales.vidas = 3
	VariablesGlobales.vida_mario == true
	VariablesGlobales.barriles = 0
	VariablesGlobales.tiempo_juego = 180
	VariablesGlobales.b_dest = -1
	position = Vector2(94, 643)
	get_tree().change_scene("res://Node.tscn")

#Se encarga de realizar todo los procesos
func _physics_process(_delta):
	if VariablesGlobales.g_b == true:#Cuando gana se reinicia el juego
		reinicia()
		VariablesGlobales.g_b = false
		get_tree().change_scene("res://Node.tscn")
	#Si mario es alcanzado por un barril pierde una vida y regresa a la posición de inicio
	if VariablesGlobales.vida_mario == false:
		VariablesGlobales.vidas -= 1
		VariablesGlobales.vida_mario = true
		position = Vector2(94, 643)
	#Si las vidas son igual a cero se reinicia el juego desde el principio
	if VariablesGlobales.vidas == 0:
		reinicia()
	#Si el tiempo de juego  es igual a cero se reinicia el juego desde el principio
	if VariablesGlobales.tiempo_juego == 0:
		reinicia()
	#Mario podrá moverse
	motion.y += gravity
	var friction = false
	#Si se detecta a Mario en las escaleras podrá subir y bajarlas
	if on_ladder == true:
		if Input.is_action_just_pressed("ui_accept"):
			motion.y = JUMP_H
		if Input.is_action_pressed("ui_up"):
			$AnimationPlayer.play("Sb_Esc")
			gravity = 0 #La gravedad debe ser cero para no suba de más
			motion.y = min(motion.y + ACELERATION, -MAX_SPEED)#Con esto podrá subir en dirección -y
		
		elif Input.is_action_pressed("ui_down"):
			gravity = 0
			$AnimationPlayer.play("Sb_Esc")
			motion.y = min(motion.y + ACELERATION, MAX_SPEED)#Con esto podrá bajar en dirección y
		else:
			motion.y = 0#Si no se presiona las teclas arriba o abajo se mantiene en la posición en la que se encuentra
	
	else:
		gravity =  20 #La gravedad se mantiene en 20 si no hay colision con escaleras
	
	#Si se presiona la tecla derecha Mario avanza por la dirección x cada 10 pixeles
	if Input.is_action_pressed("ui_right"):
		VariablesGlobales.p.x = 10
		$sprite.flip_h = false
		$AnimationPlayer.play("Walk")#Se reproduce la animación de caminar
		#$SonidoCaminar.play()
		motion.x = min(motion.x + ACELERATION, MAX_SPEED)
	#Si se presiona la tecla izquierda Mario avanza por la dirección -x cada 10 pixeles
	elif Input.is_action_pressed("ui_left"):
		VariablesGlobales.p.x = -10
		$sprite.flip_h = true #Se invierte el sprite horizontalmete
		$AnimationPlayer.play("Walk") #Se reproduce la animación de caminar
		#$SonidoCaminar.play()
		motion.x = min(motion.x + ACELERATION, -MAX_SPEED)
	#Si no se presiona alguna tecla permanece estático y sin movimiento
	else:
		$AnimationPlayer.play("Idle")
		#$SonidoCaminar.stop()
		motion.x = 0
		friction = true
	#Si la tecla d se presiona, se lanza un martillo
	if Input.is_action_pressed("d"):
		if VariablesGlobales.b == 0:
			shoot()
			
	#La función que detecta a Mario sobre el piso
	if is_on_floor():
		#Si se presiona Enter, Mario lanza un martillo mientras salta
		if Input.is_action_just_pressed("ui_accept"):
			motion.y = JUMP_H
			$SonidoBrinca.play()
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.5)		
	else:
		$SonidoBrinca.stop()
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.01)
	
	motion = move_and_slide(motion, up_direction)#Permite que los valores de movimiento se actualicen y Mario pueda moverse
#Instancia un martillo a Mario, para que sea lanzado
func shoot():
	VariablesGlobales.b = 1
	var proyectil = load("res://Martillo.tscn")
	var bullet = proyectil.instance()
	bullet.position = get_global_position() + VariablesGlobales.p
	get_parent().add_child(bullet)
