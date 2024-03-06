extends CharacterBody2D


var body_entered = false
var hit_distance_entered = false
const SPEED = 250.0
const JUMP_VELOCITY = -500.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _on_detector_body_entered(body):
	if body.name == "Player":
		body_entered = true
	

func _on_detector_body_exited(body):
	if body.name == "Player":
		body_entered = false


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	var player = $"../Player"
	var direction = (player.position - self.position).normalized()
	#var base_direction = (self.position - player.position).normalized()
	#print(player.position)

	if not is_on_floor():
		velocity.y += gravity * delta

	if body_entered == true:
		if hit_distance_entered:
			velocity.x = 0
			$AnimatedSprite2D.play('hit')
		else:
			if direction.x < 0:
				if not is_on_wall():
					velocity.x = direction.x * SPEED
					$AnimatedSprite2D.flip_h = false
					$AnimatedSprite2D.play('run')
				# else:
				# 	$AnimatedSprite2D.play('hit')
			elif direction.x >= 0:
				if not is_on_wall():
					velocity.x = direction.x * SPEED
					$AnimatedSprite2D.flip_h = true
					$AnimatedSprite2D.play('run')
				# else:
				# 	$AnimatedSprite2D.play('hit')

	else:
		if self.position.x >= 1396 and self.position.x <= 1496:
			velocity.x = 0
		else:
			if $AnimatedSprite2D.flip_h == false:
				velocity.x = 1 * SPEED
			else:
				velocity.x = -1 * SPEED

	move_and_slide()

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
