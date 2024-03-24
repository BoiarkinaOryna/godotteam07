extends Area2D

#@onready var sprite = 
# Called when the node enters the scene tree for the first time.
var speed = 1.1
var tsx = 1
#player = load("res://player/player6.tscn").instantiate()
#player.global_points = 8
	
func _physics_process(delta):
	print("bullet")
	transform.x.x = tsx
	$Sprite2D.flip_h = true
	position += transform.x * speed * delta
	print(position)
	#if global_position.x >= 5078 or global_position.x <= 2782:
		#queue_free()
