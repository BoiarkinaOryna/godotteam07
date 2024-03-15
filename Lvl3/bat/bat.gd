extends CharacterBody2D

var random = RandomNumberGenerator.new()
var speed = 300
var direction_number = random.randi_range(0, 4)
var gravity = 0

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if direction_number == 1:
		if not is_on_wall():
			velocity.x = -1 * speed
			$AnimatedSprite2D.play('idle')
		else:
			velocity.x = 1 * speed

	if direction_number == 2:
		if not is_on_wall():
			velocity.y = 1 * speed
			$AnimatedSprite2D.play('idle')
		else:
			velocity.y = -1 * speed

	if direction_number == 3:
		if not is_on_wall():
			velocity.x = 1 * speed
			$AnimatedSprite2D.play('idle')
		else:
			velocity.x = -1 * speed

	if direction_number == 4:
		if not is_on_wall():
			velocity.y = -1 * speed
			$AnimatedSprite2D.play('idle')
		else:
			velocity.y = 1 * speed
	move_and_slide()
