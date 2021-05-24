extends KinematicBody2D

const ACELERATION = 50
const MAX_SPEED = 100
const JUMP_H = -280
const up_direction = Vector2(0, -1)
var gravity = 20
var t = 0

#onready var sprite = $M_walk
#nready var sprite2 = $M_up
var on_ladder = false
#onready var animationPlayer = $AnimationPlayer

var motion = Vector2()

func _physics_process(_delta):
	motion.y += gravity
	var friction = false
	
	if on_ladder == true:
		if Input.is_action_just_pressed("ui_accept"):
			motion.y = JUMP_H
			print("Brinca")
		if Input.is_action_pressed("ui_up"):
			#sprite.visible = false
			#sprite2.visible = true
			$AnimationPlayer.play("Sb_Esc")
			gravity = 0
			motion.y = min(motion.y + ACELERATION, -MAX_SPEED)
			
		elif Input.is_action_pressed("ui_down"):
			gravity = 0
			#sprite.visible = false
			#sprite2.visible = true
			$AnimationPlayer.play("Sb_Esc")
			motion.y = min(motion.y + ACELERATION, MAX_SPEED)
		else:
			motion.y = 0
		
	else:
		#sprite.visible = true
		#sprite2.visible = false
		gravity =  20
	
	
	if Input.is_action_pressed("ui_right"):
		VariablesGlobales.p.x = 10
		$sprite.flip_h = false
		$AnimationPlayer.play("Walk")
		#$SonidoCaminar.play()
		motion.x = min(motion.x + ACELERATION, MAX_SPEED)
		
	elif Input.is_action_pressed("ui_left"):
		VariablesGlobales.p.x = -10
		$sprite.flip_h = true
		$AnimationPlayer.play("Walk")
		#$SonidoCaminar.play()
		motion.x = min(motion.x + ACELERATION, -MAX_SPEED)
	else:
		$AnimationPlayer.play("Idle")
		#$SonidoCaminar.stop()
		motion.x = 0
		friction = true
	
	if Input.is_action_pressed("d"):
		if VariablesGlobales.b == 0:
			shoot()
			
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_accept"):
			motion.y = JUMP_H
			$SonidoBrinca.play()
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.5)		
	else:
		$SonidoBrinca.stop()
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.01)
	
	motion = move_and_slide(motion, up_direction)
	
func shoot():
	VariablesGlobales.b = 1
	var proyectil = load("res://Martillo.tscn")
	var bullet = proyectil.instance()
	bullet.position = get_global_position() + VariablesGlobales.p
	get_parent().add_child(bullet)

