extends Area2D



func _on_body_entered(body):
	if body.name == "Player1":
		body.heart_points -= 1
		print("Spike hit")
