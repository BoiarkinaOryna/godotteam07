extends Area2D
var burn = false
var player
var burning_flag = false

func burning():
	print("1burn = ", burn)
	print(burning_flag)
	if burn and burning_flag:
		player.heart_points -=1

func _on_body_entered(body):
	if body.name == "Player4":
		burning_flag = true
		$Timer.start()
		player = body
		body.heart_points -=1
		print("Timer start")

func _on_timer_timeout():
	burn = true
	print("2burn = ", burn)
	burning()


func _on_body_exited(body):
	if body.name == "Player4":
		burning_flag = false
