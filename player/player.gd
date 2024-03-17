extends CharacterBody2D

var heart_points = 9
var speed = 300.0
var jump_velocity = -500.0
var animation
var animated_sprite
var jump_animation = false
@onready var hp = get_node("hp/Hp")

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	animation = get_node("AnimatedSprite2D")
	animated_sprite = get_node("AnimatedSprite2D")
	#Dialogic.start("prefaceTimeline")

func _on_timer_timeout():
	jump_animation = true
	
func show_hp():
	if heart_points == 9:
		hp.play("9")
	elif heart_points == 8:
		hp.play("8")
	elif heart_points == 7:
		hp.play("7")
	elif heart_points == 6:
		hp.play("6")
	elif heart_points == 5:
		hp.play("5")
	elif heart_points == 4:
		hp.play("4")
	elif heart_points == 3:
		hp.play("3")
	elif heart_points == 2:
		hp.play("2")	
	elif heart_points == 1:
		hp.play("1")	
	elif heart_points == 0:
		hp.play("0")
		get_tree().change_scene_to_file("res://preface//preface1.tscn")

func _physics_process(delta):
	show_hp()
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity
		jump_animation = true

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * speed
		if direction == 1:
			animated_sprite.flip_h = false
		elif direction == -1:
			animated_sprite.flip_h = true
			
		if is_on_floor():
			animation.play("run")
			jump_animation = false
		else:
			if jump_animation:
				animation.play("jump")
		
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		if is_on_floor():
			animation.play("idle")
		else:
			if jump_animation:
				animation.play("jump")
	move_and_slide()
