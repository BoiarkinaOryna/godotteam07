extends CharacterBody2D


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var chase = false
var attack = false
var speed = 200
@onready var anim = $AnimatedSprite2D
var alive = true


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	var player = $"../Player"
	var direction = (player.position - self.position).normalized()
	if alive:
		if chase:
			velocity.x = direction.x * speed
		if !chase:
			velocity.x = 0
			anim.play('idle')
		if direction.x < 0:
			if !attack:
				$AnimatedSprite2D.flip_h = false
				anim.play('walk')
		elif direction.x >0:
			if !attack:
				$AnimatedSprite2D.flip_h = true
				anim.play('walk')
	move_and_slide()

func _on_detector_body_entered(body):
	if body.name == 'Player':
		chase=true


func _on_detector_body_exited(body):
	if body.name == 'Player':
		chase=false


func _on_attack_zone_body_entered(body):
	print(body.name)
	if body.name == 'Player':
		attack = true
		anim.play("attack")
	else:
		velocity.y = -400


func _on_attack_zone_body_exited(body):
	if body.name == 'Player':
		attack = false
