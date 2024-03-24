extends Area2D

var speed = 500
var tsx = 1
#player = load("res://player/player6.tscn").instantiate()
#player.global_points = 8
	
func _physics_process(delta):
	transform.x.x = tsx
	$AnimatedSprite2D.flip_h = true
	$AnimatedSprite2D.play("shoot")
	position += transform.x * speed * delta
	if global_position.x >= 5078 or global_position.x <= 2782:
		queue_free()

func _on_body_entered(body):
	if body.name == "Player2":
		body.heart_points -= 1
		queue_free()
