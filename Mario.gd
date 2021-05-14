extends KinematicBody2D

var vel_act = Vector2()
var GRAVEDAD = 9.8
export (float) var vel_mov
var on_ladder = false

func _ready():
	pass

func _physics_process(delta):
	vel_act.y += GRAVEDAD * delta
	
	if on_ladder == true:
		if Input.is_action_pressed("tecla_arriba"):
			vel_act.y = -vel_mov
			GRAVEDAD = 0
			$AnimationPlayer.play("trepar")
		
		elif Input.is_action_pressed("tecla_abajo"):
			vel_act.y = vel_mov
			GRAVEDAD = 0
			$AnimationPlayer.play("trepar")
		else:
			vel_act.x = 0
	
	if Input.is_action_pressed("tecla_izquierda"):
		vel_act.x = -vel_mov
		$Sprite.flip_h = false
		$AnimationPlayer.play("caminar")
	elif Input.is_action_pressed("tecla_derecha"):
		vel_act.x = vel_mov
		$Sprite.flip_h = true
		$AnimationPlayer.play("caminar")
	else: 
		vel_act.x = 0
		$AnimationPlayer.play("idle")
	
	check_raycast()
	
	move_and_collide(vel_act * delta)

func check_raycast():
	if($ray.is_colliding()):
		var objeto_colisionado = $ray.get_collider()
		if(objeto_colisionado.is_in_group("suelo")):
			vel_act.y = 0
			global_position.y = ($ray.get_collision_point().y - $CollisionShape2D.shape.extents.y - 10)
			
