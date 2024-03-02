extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var chase = false
var speed = 125
var stop = 0
var JUMP_VELOCITY = -350.0
#var speed2 = 200

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
	
	var player = $"../Player"
	var direction = (player.position - self.position).normalized()
	print(player.position)
	print(self.position)
	#1251
	if chase == true:
		if direction.x >= 0:
			if not is_on_wall():
				#print(self.position.x)
				#velocity.x = direction.x * speed2
				$AnimatedSprite2D.flip_h = velocity.x < 0
				$AnimatedSprite2D.play('walk')
				
				#$AnimatedSprite2D.flip_h = velocity.x < 0
				velocity.x = direction.x * speed
			else:
				$AnimatedSprite2D.play('attack')
		elif direction.x < 0:
			#if self.position.x >= 1245:
				#velocity.x = direction.x * stop
				#$AnimatedSprite2D.play('idle')
			#
			if not is_on_wall():
				#print('two')
				$AnimatedSprite2D.flip_h = velocity.x < 0
				$AnimatedSprite2D.play('walk')
				velocity.x = direction.x * speed
			else:
				#$AnimatedSprite2D.flip_h = velocity.x > 0
				$AnimatedSprite2D.play('attack')
	else:
		velocity.x = 0
		$AnimatedSprite2D.play('idle')
	move_and_slide()
