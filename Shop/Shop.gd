extends CanvasLayer

var coins = 20
var fire_cost = 10
var fire_owned = false
var water_cost = 5
var water_owned = false

func _on_fire_b_pressed():
	print("fire_b")
	if not fire_owned:
		if coins >= fire_cost:
			coins -= fire_cost
			print(coins)
			fire_owned = true	

func _on_water_b_pressed():
	print("water_b")
	if not water_owned:
		if coins >= water_cost:
			coins -= water_cost
			print(coins)
			water_owned = true
