extends Area2D
@onready var player = $"../../Player1"
#@onready var sprite = 
# Called when the node enters the scene tree for the first time.
var speed = 500
var tsx = 1
#player = load("res://player/player6.tscn").instantiate()
#player.global_points = 8
var direction = 0
var start_pos
func _physics_process(delta):
	#print(direction)
	if player.animation.flip_h:
		direction = -1
	else:
		direction = 1
	transform.x.x = direction
	position += transform.x * speed * delta
	if position.x >= 600 or position.x <= -600:
		queue_free()
		player.attack=false
