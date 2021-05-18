extends KinematicBody2D

const ACELERATION = 50
const MAX_SPEED = 100
const JUMP_H = -280
const up_direction = Vector2(0, -1)
var gravity = 20

onready var sprite = $M_walk
onready var sprite2 = $M_up
var on_ladder = false
#onready var animationPlayer = $AnimationPlayer

var motion = Vector2()

func _physics_process(_delta):
	motion.y += gravity
	var friction = false
	
	if on_ladder == true:
		
		if Input.is_action_pressed("ui_up"):
			sprite.visible = false
			sprite2.visible = true
			get_node("AnimationPlayer").play("Sb_Esc")
			gravity = 0
			motion.y = min(motion.y + ACELERATION, -MAX_SPEED)
			
		elif Input.is_action_pressed("ui_down"):
			gravity = 0
			sprite.visible = false
			sprite2.visible = true
			get_node("AnimationPlayer").play("Sb_Esc")
			motion.y = min(motion.y + ACELERATION, MAX_SPEED)
		else:
			motion.y = 0
		
	else:
		sprite.visible = true
		sprite2.visible = false
		gravity =  20
	
	
	if Input.is_action_pressed("ui_right"):
		sprite.flip_h = false
		get_node("AnimationPlayer").play("Walk")
		motion.x = min(motion.x + ACELERATION, MAX_SPEED)
		
	elif Input.is_action_pressed("ui_left"):
		sprite.flip_h = true
		get_node("AnimationPlayer").play("Walk")
		motion.x = min(motion.x + ACELERATION, -MAX_SPEED)
	else:
		get_node("AnimationPlayer").play("Idle")
		motion.x = 0
		friction = true
	
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_accept"):
			motion.y = JUMP_H
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.5)		
	else:
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.01)
	
	motion = move_and_slide(motion, up_direction)

