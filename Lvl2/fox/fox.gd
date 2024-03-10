extends CharacterBody2D

var sit_flag = false
var body_entered = false
var hit_distance_entered = false
var fox_speed = 160
var player_ret_speed = false
const JUMP_VELOCITY = -500.0
@export var spike_left : PackedScene
@export var spike_right : PackedScene

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

#func _on_timer_timeout():
	#player_ret_speed = true
	

func _on_detector_body_entered(body):
	if body.name == "Player":
		body_entered = true

func _on_detector_body_exited(body):
	if body.name == "Player":
		body_entered = false


func _on_hit_distance_body_entered(body):
	if body.name == "Player":
		hit_distance_entered = true

func _on_hit_distance_body_exited(body):
	if body.name == "Player":
		hit_distance_entered = false


func _on_blocks_collision_body_entered(body):
	if body.name == "Player":
		body_entered = true
	else:
		velocity.y = JUMP_VELOCITY


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	var player = $"../Player"
	print(player.speed)
	var direction = (player.position - self.position).normalized()
	#print(player.position)

	if not is_on_floor():
		velocity.y += gravity * delta

	if body_entered:
		if direction.x < 0:
			if not is_on_wall():
				if hit_distance_entered:
					velocity.x = 0
					$AnimatedSprite2D.play('hit')
					var spkl = spike_left.instantiate()
					var spkr = spike_right.instantiate()
					add_child(spkl)
					add_child(spkr)
					spkl.transform = $Node/Marker2DL.global_transform
					spkr.transform = $Node/Marker2DR.global_transform
					player.speed = 50
					player.jump_velocity = 0
				else:
					#$Timer.start()
					player.speed = 300
					player.jump_velocity = -500

					velocity.x = direction.x * fox_speed
					$AnimatedSprite2D.flip_h = false
					$AnimatedSprite2D.play('run')
		elif direction.x >= 0:
			if not is_on_wall():
				if hit_distance_entered:
					velocity.x = 0
					$AnimatedSprite2D.play('hit')
					var spkl = spike_left.instantiate()
					var spkr = spike_right.instantiate()
					add_child(spkl)
					add_child(spkr)
					spkl.transform = $Node/Marker2DL.global_transform
					spkr.transform = $Node/Marker2DR.global_transform
					player.speed = 50
					player.jump_velocity = 0
				else:
					#$Timer.start()
					player.speed = 300
					player.jump_velocity = -500
					
					velocity.x = direction.x * fox_speed
					$AnimatedSprite2D.flip_h = true
					$AnimatedSprite2D.play('run')
	else:
		if self.position.x >= 1396 and self.position.x <= 1496:
			velocity.x = 0
			fox_speed = 160
			if not sit_flag:
				$AnimatedSprite2D.play('sit')
				sit_flag = true
			else:
				$AnimatedSprite2D.play('idle')
				if player_ret_speed:
					player.speed = 300
			
		else:
			fox_speed = 250
			if self.position.x <= 1396:
				velocity.x = 1 * fox_speed
				$AnimatedSprite2D.flip_h = true
			elif self.position.x >= 1496:
				velocity.x = -1 * fox_speed
				$AnimatedSprite2D.flip_h = false

	move_and_slide()
