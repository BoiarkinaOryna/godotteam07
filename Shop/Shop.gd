extends CanvasLayer
var lvl
var coins = 20
var fire_cost = 10
var fire_owned = false
var water_cost = 5
var water_owned = false
@export var moving : PackedScene
func _process(delta):
	lvl = Shop.lvl
	coins = Shop.coins
#func _on_fire_b_pressed():
	#print("fire_b")
	#if not fire_owned:
		#if coins >= fire_cost:
			#coins -= fire_cost
			#print(coins)
			#fire_owned = true
#
#func _on_water_b_pressed():
	#print("water_b")
	#if not water_owned:
		#if coins >= water_cost:
			#coins -= water_cost
			#print(coins)
			#water_owned = true
func on_death_enemy():
	coins += 30


func _on_fire_pressed():
	pass # Replace with function body.


func _on_water_pressed():
	pass # Replace with function body.


func _on_gray_pressed():
	var move = moving.instantiate()
	var gray = move.get_node('hit')
	
	print(1)
	print(gray.visible)
	gray.visible = true
	print(gray.visible)


func _on_purple_pressed():
	pass # Replace with function body.


func _on_quit_pressed():
	if lvl == 'Lvl1':
		get_tree().change_scene_to_file("res://1Lvl/Lvl1.tscn")
	elif lvl == 'Lvl2':
		get_tree().change_scene_to_file("res://Lvl2/Lvl2.tscn")
	elif lvl == 'Lvl3':
		get_tree().change_scene_to_file("res://Lvl3/Lvl3.tscn")
	elif lvl == 'Lvl4':
		get_tree().change_scene_to_file("res://Lvl4/Lvl4.tscn")
	elif lvl == 'Lvl5':
		get_tree().change_scene_to_file("res://Lvl5/Lvl5.tscn")
	elif lvl == 'Lvl6':
		get_tree().change_scene_to_file("res://Lvl6/Lvl6.tscn")
