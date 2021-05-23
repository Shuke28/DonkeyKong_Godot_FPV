extends KinematicBody2D

var t 

func _ready():
	t = 0
	
	
	
func lanza_barril():
	var barril = load("res://Barril.tscn")
	var barr = barril.instance()
	barr.position = get_global_position() + Vector2(45, 0)
	get_parent().add_child(barr)
	

func _process(delta):
	t += 1
	
	if t > 30:
		lanza_barril()
		print(t)
		t = 0
		
	
	$Sprite.flip_h = false
	get_node("AnimationPlayer").play("recogerAventar")
