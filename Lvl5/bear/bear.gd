extends CharacterBody2D



var chase = false
var attack = false
var speed = 100
@onready var anim = $AnimatedSprite2D
var alive = true
var hp = 100
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
		# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	var player = $"../Player5"
	var direction = (player.position - self.position).normalized()
	if alive:
		if chase:
			velocity.x = direction.x * speed
		if !chase:
			velocity.x = 0
			anim.play('idle')
		if direction.x < 0:
			if !attack:
				$AnimatedSprite2D.flip_h = true
				anim.play('walk')
		elif direction.x >0:
			if !attack:
				$AnimatedSprite2D.flip_h = false
				anim.play('walk')
	if hp <= 0:
		queue_free()
	move_and_slide()


func _on_detector_body_entered(body):
	if body.name == 'Player5':
		chase=true


func _on_detector_body_exited(body):
	if body.name == 'Player5':
		chase=false


func _on_attack_zone_body_entered(body):
	if body.name == 'Player5':
		attack = true
		anim.play("attack")
		await get_tree().create_timer(1).timeout
		while attack:
			body.heart_points -= 3
			await get_tree().create_timer(1).timeout
	else:
		velocity.y = -400


func _on_attack_zone_body_exited(body):
	if body.name == 'Player5':
		attack = false
