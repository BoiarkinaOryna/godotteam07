extends CharacterBody2D


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var chase = false
var attack = false
var speed = 200
@onready var anim = $AnimatedSprite2D
var alive = true
var hp = 100

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	var player = $"../Player1"
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
	if hp <= 0:
		Shop.on_death_enemy()
		#get_tree().change_scene_to_file('res://Shop/Shop.tscn')
		queue_free()
		print(get_parent().get_path())
	move_and_slide()

func _on_detector_body_entered(body):
	if body.name == 'Player1':
		chase=true


func _on_detector_body_exited(body):
	if body.name == 'Player1':
		chase=false


func _on_attack_zone_body_entered(body):
	print(body.name)
	if body.name == 'Player1':
		attack = true
		anim.play("attack")
		await get_tree().create_timer(0.5).timeout
		while attack:
			body.heart_points -= 1
			await get_tree().create_timer(0.5).timeout
	else:
		velocity.y = -400


func _on_attack_zone_body_exited(body):
	if body.name == 'Player1':
		attack = false
