extends CharacterBody2D

var body_entered = false
var wp_speed = 240
var walk_counter = 0
var counter_flag = false
var right_flag = false
var left_flag = false
var shoot_counter = 0
var damage_wave_counter = 0
var first_base
var hp = 1000
var second_base

@export var wp_bullet : PackedScene
@export var wp_damage_wave : PackedScene

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

#func _ready(): 
	#$Timer2.start()
	#$Timer3.start()

#func _on_timer_timeout():
	#print(velocity.x)
	#$AnimatedSprite2D.stop()
	#if body_entered and right_flag:
		#$AnimatedSprite2D.play('shoot')
		#await $AnimatedSprite2D.animation_finished
		#var wp_bul = wp_bullet.instantiate()
		#wp_bul.tsx = 1
		#add_child(wp_bul)
		#wp_bul.transform = $Node/Marker2D.global_transform

#func _on_timer_2_timeout():
	#print(velocity.x)
	#$AnimatedSprite2D.stop()
	#if body_entered and left_flag:
		#$AnimatedSprite2D.play('shoot')
		#await $AnimatedSprite2D.animation_finished
		#var wp_bul = wp_bullet.instantiate()
		#wp_bul.tsx = -1
		#add_child(wp_bul)
		#wp_bul.transform = $Node/Marker2D.global_transform

#func _on_timer_3_timeout():
	#$AnimatedSprite2D.stop()
	#velocity.x = 0
	#print(velocity.x)
	#$Timer.stop()
	#$Timer2.stop()
	#if body_entered:
		#$AnimatedSprite2D.play('damage_wave')
		#await $AnimatedSprite2D.animation_finished
		#var wp_dam_wave = wp_damage_wave.instantiate()
		#add_child(wp_dam_wave)
		#wp_dam_wave.transform = $Node/Marker2D.global_transform
		#$Timer.start()
		#$Timer2.start()

func _on_detector_body_entered(body):
	if body.name == "Player7":
		body_entered = true
		
func _on_detector_body_exited(body):
	if body.name == "Player7":
		body_entered = false

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	var player = $"../Player7"
	#print(player.speed)
	var direction = (player.position - self.position).normalized()
	first_base = player.position.x + 250
	second_base = player.position.x - 250
	#print(direction)
	#print(player.position)

	if not is_on_floor():
		velocity.y += gravity * delta

	if body_entered:
		
		if direction.x < 0:
			if not is_on_wall():
				$AnimatedSprite2D.flip_h = true
				if not self.position.x <= first_base:
					velocity.x = direction.x * wp_speed
					$AnimatedSprite2D.play('walk')
				else:
					velocity.x = 0
					shoot_counter += 1
					damage_wave_counter += 1
					left_flag = true
					right_flag = false
					#$Timer.start()
					
					#print(damage_wave_counter)
					if shoot_counter >= 100 and shoot_counter <= 130 and damage_wave_counter <= 600:
						$AnimatedSprite2D.play('shoot')
					if shoot_counter <= 100 and damage_wave_counter <= 600:
						$AnimatedSprite2D.play('idle')
					if shoot_counter >= 150 and damage_wave_counter <= 600:
						var wp_bul = wp_bullet.instantiate()
						wp_bul.tsx = -1
						add_child(wp_bul)
						wp_bul.transform = $Node/Marker2D.global_transform
						shoot_counter = 0
					if damage_wave_counter >= 600:
						print('damage_wave1')
						shoot_counter = 0
						$AnimatedSprite2D.play('damage_wave')
						var wp_dam_wave = wp_damage_wave.instantiate()
						add_child(wp_dam_wave)
						wp_dam_wave.transform = $Node/Marker2D.global_transform
						damage_wave_counter = 0
						await wp_dam_wave.animation.animation_finished
			else:
				$AnimatedSprite2D.play('idle')
		if direction.x >= 0:
			if not is_on_wall():
				$AnimatedSprite2D.flip_h = false
				if not self.position.x >= second_base:
					velocity.x = direction.x * wp_speed
					$AnimatedSprite2D.play('walk')
				else:
					velocity.x = 0
					shoot_counter += 1
					damage_wave_counter += 1
					right_flag = true
					left_flag = false
					#$Timer2.start()
					
					#print(damage_wave_counter)
					if shoot_counter >= 100 and shoot_counter <= 130 and damage_wave_counter <= 600:
						$AnimatedSprite2D.play('shoot')
					if shoot_counter <= 100 and damage_wave_counter <= 600:
						$AnimatedSprite2D.play('idle')
					if shoot_counter >= 150 and damage_wave_counter <= 600:
						var wp_bul = wp_bullet.instantiate()
						wp_bul.tsx = 1
						add_child(wp_bul)
						wp_bul.transform = $Node/Marker2D.global_transform
						shoot_counter = 0
						
					if damage_wave_counter >= 600:
						print('damage_wave2')
						shoot_counter = 0
						$AnimatedSprite2D.play('damage_wave')
						#await $AnimatedSprite2D.animation_finished
						var wp_dam_wave = wp_damage_wave.instantiate()
						add_child(wp_dam_wave)
						wp_dam_wave.transform = $Node/Marker2D.global_transform
						damage_wave_counter = 0
						await wp_dam_wave.animation.animation_finished
			else:
				$AnimatedSprite2D.play('idle')
	else:
		velocity.x = 0
		$AnimatedSprite2D.play('idle')
	if hp <= 0:
		#Dialogic.start("FinalLvl7")
		queue_free()
		get_tree().change_scene_to_file('res://Menu/Menu.tscn')
	move_and_slide()
	
