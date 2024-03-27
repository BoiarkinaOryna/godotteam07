extends CanvasLayer

var coins = 20
#func _ready():
	
var player_scene_path = "res://player/player.gd"
var player_script = load("res://player/player.gd")
var script_new = player_script.new()
#var fire_cost = 10
#var water_cost = 5
#var purple_cost = 15

func _on_fire_b_pressed():
	print("fire_b")
	script_new.heart_points -= 1
	ResourceSaver.save(player_script, player_scene_path)
	#if not fire_owned:
		#if coins >= fire_cost:
			#coins -= fire_cost
			#print(coins)
			#fire_owned = true	

func _on_water_b_pressed():
	print("water_b")
	#if not water_owned:
		#if coins >= water_cost:
			#coins -= water_cost
			#print(coins)
			#water_owned = true


func _on_purple_b_pressed():
	print("purple_b")
	#if not water_owned:
		#if coins >= water_cost:
			#coins -= water_cost
			#print(coins)
			#water_owned = true


func _on_button_pressed():
	get_tree().change_scene_to_file("res://1Lvl/Lvl1.tscn")
