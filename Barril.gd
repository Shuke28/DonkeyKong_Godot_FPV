extends Node2D


onready var barril = get_node("RigidBody2D")
export (PackedScene) var scene

# Called when the node enters the scene tree for the first time.
func _ready():
	barril.apply_impulse(Vector2(200, 0), Vector2(200, 0))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(barril.get_colliding_bodies())
	if barril.linear_velocity.x < 0:
		barril.apply_impulse(Vector2(-100, 80), Vector2(-100, 80))



