extends Area2D

var speed = 100

func _physics_process(delta):
	position += transform.y * speed * delta


func _on_body_entered(body):
	if body.name == 'Player':
		pass
