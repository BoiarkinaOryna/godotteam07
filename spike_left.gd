extends Area2D

var speed = 100
var stop = 0

func _physics_process(delta):
	if global_position.y >= 400:
		queue_free()
	else:
		position.y -= speed * delta
