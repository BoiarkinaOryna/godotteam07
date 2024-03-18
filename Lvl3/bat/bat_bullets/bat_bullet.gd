extends Area2D

var speed = 300
var position_flag = false
var player_position

func _physics_process(delta):
	$AnimatedSprite2D.play('shoot')
	var direction = (player_position - global_position).normalized()
	#вычисляем расстояние до игрока
	var distance = global_position.distance_to(player_position)
	#перемещаем объект с заданной скоростью
	global_position += direction * min(speed * delta, distance)
	if global_position == player_position:
		queue_free()
func _on_body_entered(body):
	if body.name == 'Player3':
		body.heart_points -= 1
		queue_free()
	if body.name == 'TileMap':
		queue_free()
