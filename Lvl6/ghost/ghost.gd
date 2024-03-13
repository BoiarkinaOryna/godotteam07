extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var chase = false
var speed = 125
var stop = 0
var JUMP_VELOCITY = -350.0
var colldown = false
@onready var player = $"../Player"
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


func _timer():
	$Timer.start()
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	
	var direction = (player.position - self.position).normalized()
	#print(player.position)
	#print(self.position)
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
				print(colldown)
				_timer()
				#if colldown:
					#$AnimatedSprite2D.play('attack')
					#player.heart_points -= 1
					#print(123)
					#colldown = false
		elif direction.x < 0:

			if not is_on_wall():
				#print('two')
				$AnimatedSprite2D.flip_h = velocity.x < 0
				$AnimatedSprite2D.play('walk')
				velocity.x = direction.x * speed
			else:
				print("ghost colldown =", colldown)
				_timer()
				
	else:
		velocity.x = 0
		$AnimatedSprite2D.play('idle')
	move_and_slide()


func _on_timer_timeout():
	colldown = true
	#print(colldown)


func _on_area_2d_body_entered(body):
	if body.name == 'Player':
		if colldown:
			$AnimatedSprite2D.play('attack')
			player.heart_points -= 1
			colldown = false
