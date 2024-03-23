extends Area2D
var burn = false

#func _physics_process(delta):
	#print("1burn = ", burn)
	#if burn:
		#body.heart_points -=1
		#burn = false

func _on_body_entered(body):
	if body.name == "Player4":
		$Timer.start()
		print("Timer start")

func _on_timer_timeout():
	burn = true
	print("2burn = ", burn)
