extends CharacterBody2D

var random = RandomNumberGenerator.new()
var speed = 200
var gravity = 0
var timer_flag = false
var direction_number
var hp = 30
@export var bat_bullet : PackedScene

func _ready():
	$AnimatedSprite2D.play('idle')
	$Timer.start()
		
func _on_detector_body_entered(body):
	print(1)
	if body.name == 'Player3':
		print(2)
		$Timer2.start()
		
func _on_detector_body_exited(body):
	if body.name == 'Player3':
		$Timer2.stop()

func _on_timer_2_timeout():
	var bat_bul = bat_bullet.instantiate()
	print($"../Player3".position)
	bat_bul.player_position = $"../Player3".position
	add_child(bat_bul)
	bat_bul.transform = $Node/Marker2D.global_transform
	
func _on_timer_timeout():
	direction_number = random.randi_range(0, 4)

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if direction_number == 1:
		velocity.x = -1 * speed
		direction_number = random.randi_range(0, 4)

	if direction_number == 2:
		velocity.y = 1 * speed
		direction_number = random.randi_range(0, 4)

	if direction_number == 3:
		velocity.x = 1 * speed
		direction_number = random.randi_range(0, 4)

	if direction_number == 4:
		velocity.y = -1 * speed
		direction_number = random.randi_range(0, 4)
	if hp <= 0:
		Shop.on_death_enemy()
		queue_free()
	move_and_slide()
