extends CharacterBody2D

var body_entered = false
var wp_speed = 100
var walk_counter = 0
var counter_flag = false
var right_flag = false
var left_flag = false
var hp_counter = 0
var first_base
var second_base

@export var wp_bullet : PackedScene
@export var wp_damage_wave : PackedScene

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready(): 
	$Timer2.start()
	$Timer3.start()

func _on_timer_timeout():
	if body_entered and right_flag:
		var wp_bul = wp_bullet.instantiate()
		wp_bul.tsx = 1
		add_child(wp_bul)
		wp_bul.transform = $Node/Marker2D.global_transform

func _on_timer_2_timeout():
	if body_entered and left_flag:
		var wp_bul = wp_bullet.instantiate()
		wp_bul.tsx = -1
		add_child(wp_bul)
		wp_bul.transform = $Node/Marker2D.global_transform

func _on_timer_3_timeout():
	if body_entered:
		var wp_dam_wave = wp_damage_wave.instantiate()
		add_child(wp_dam_wave)
		wp_dam_wave.transform = $Node/Marker2D.global_transform

func _on_detector_body_entered(body):
	if body.name == "Player7":
		body_entered = true
		
func _on_detector_body_exited(body):
	if body.name == "Player7":
		body_entered = false
	
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	var player = $"../Player7"
	#print(player.speed)
	var direction = (player.position - self.position).normalized()
	first_base = player.position.x + 250
	second_base = player.position.x - 250
	#print(direction)
	#print(player.position)

	if not is_on_floor():
		velocity.y += gravity * delta

	if body_entered:
		if direction.x < 0:
			if not is_on_wall():
				$AnimatedSprite2D.flip_h = true
				if not self.position.x <= first_base:
					velocity.x = direction.x * wp_speed
				else:
					velocity.x = 0
					left_flag = true
					right_flag = false
					$Timer.start()
		if direction.x >= 0:
			if not is_on_wall():
				$AnimatedSprite2D.flip_h = false
				if not self.position.x >= second_base:
					velocity.x = direction.x * wp_speed
				else:
					velocity.x = 0
					right_flag = true
					left_flag = false
					$Timer2.start()
	else: velocity.x = 0
	move_and_slide()
	
