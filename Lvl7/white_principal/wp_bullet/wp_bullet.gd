extends Area2D

var speed = 450
var tsx = 1

func _physics_process(delta):
	transform.x.x = tsx
	$Sprite2D.flip_h = false
	#$AnimatedSprite2D.play("shoot")
	position += transform.x * speed * delta

func _on_body_entered(body):
	if body.name == 'Player7':
		body.heart_points -= 1
		queue_free()
	if body.name == 'TileMap':
		queue_free()
