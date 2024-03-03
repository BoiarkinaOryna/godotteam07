extends CharacterBody2D

var body_entered = false
const SPEED = 250.0
const JUMP_VELOCITY = -400.0

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
	
	if not is_on_floor():
		velocity.y += gravity * delta

	if body_entered == true:
		if direction.x < 0:
			if not is_on_wall():
				velocity.x = direction.x * SPEED
				$AnimatedSprite2D.flip_h = false
				$AnimatedSprite2D.play('run')
			else:
				$AnimatedSprite2D.play('hit')
		elif direction.x >= 0:
			if not is_on_wall():
				velocity.x = direction.x * SPEED
				$AnimatedSprite2D.flip_h = true
				$AnimatedSprite2D.play('run')
			else:
				$AnimatedSprite2D.play('hit')

	else:
		velocity.x = 0
		

	move_and_slide()





