extends Area2D
@onready var player = get_parent()
#@onready var sprite = 
# Called when the node enters the scene tree for the first time.
var speed = 800
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
	if position.x >= 450 or position.x <= -450:
		queue_free()
		player.attack=false


func _on_body_entered(body):
	var enemies = get_tree().get_nodes_in_group('Enemy')
	if body in enemies:
		body.hp -= 30
		player.attack=false
		queue_free()
	elif body.name == player.name:
		pass
	else:
		player.attack=false
		queue_free()
	
