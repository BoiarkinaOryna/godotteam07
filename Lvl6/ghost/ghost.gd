extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var chase = false
var speed = 125
var stop = 0
var hp = 100
var JUMP_VELOCITY = -350.0
var hp_counter = 0

@onready var player = $"../Player"

func _on_detector_body_entered(body):
	if body.name == 'Player':
		chase = true

func _on_detector_body_exited(body):
	if body.name == 'Player':
		chase = false
		
func _on_body_coll_body_entered(body):
	if body.name == 'Player':
		chase = true
	else:
		velocity.y = JUMP_VELOCITY
	
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	var direction = (player.position - self.position).normalized()
	#print(player.position)
	#print(self.position)

	if chase == true:
		if direction.x >= 0:
			if not is_on_wall():
				$AnimatedSprite2D.flip_h = false
				$AnimatedSprite2D.play('walk')
				velocity.x = direction.x * speed
			else:
				$AnimatedSprite2D.play('attack')
				
				hp_counter += 1
				if hp_counter == 50:
					if player.heart_points == 9:
						player.heart_points = 8
					else:
						hp_counter = 100
				if hp_counter == 100:
					if player.heart_points == 8:
						player.heart_points = 7
					else:
						hp_counter = 150
				if hp_counter == 150:
					if player.heart_points == 7:
						player.heart_points = 6
					else:
						hp_counter = 200
				if hp_counter == 200:
					if player.heart_points == 6:
						player.heart_points = 5
					else:
						hp_counter = 250
				if hp_counter == 250:
					if player.heart_points == 5:
						player.heart_points = 4
					else:
						hp_counter = 300
				if hp_counter == 300:
					if player.heart_points == 4:
						player.heart_points = 3
					else:
						hp_counter = 350
				if hp_counter == 350:
					if player.heart_points == 3:
						player.heart_points = 2
					else:
						hp_counter = 400
				if hp_counter == 400:
					if player.heart_points == 2:
						player.heart_points = 1
					else:
						hp_counter = 450
				if hp_counter == 450:
					if player.heart_points == 1:
						player.heart_points = 0
		elif direction.x < 0:

			if not is_on_wall():
				$AnimatedSprite2D.flip_h = true
				$AnimatedSprite2D.play('walk')
				velocity.x = direction.x * speed
			else:
				await $AnimatedSprite2D.animation_finished
				$AnimatedSprite2D.play('attack')
				
				hp_counter += 1
				if hp_counter == 50:
					if player.heart_points == 9:
						player.heart_points = 8
					else:
						hp_counter = 100
				if hp_counter == 100:
					if player.heart_points == 8:
						player.heart_points = 7
					else:
						hp_counter = 150
				if hp_counter == 150:
					if player.heart_points == 7:
						player.heart_points = 6
					else:
						hp_counter = 200
				if hp_counter == 200:
					if player.heart_points == 6:
						player.heart_points = 5
					else:
						hp_counter = 250
				if hp_counter == 250:
					if player.heart_points == 5:
						player.heart_points = 4
					else:
						hp_counter = 300
				if hp_counter == 300:
					if player.heart_points == 4:
						player.heart_points = 3
					else:
						hp_counter = 350
				if hp_counter == 350:
					if player.heart_points == 3:
						player.heart_points = 2
					else:
						hp_counter = 400
				if hp_counter == 400:
					if player.heart_points == 2:
						player.heart_points = 1
					else:
						hp_counter = 450
				if hp_counter == 450:
					if player.heart_points == 1:
						player.heart_points = 0
	else:
		velocity.x = 0
		$AnimatedSprite2D.play('idle')
	if hp <= 0:
		queue_free()
	move_and_slide()
