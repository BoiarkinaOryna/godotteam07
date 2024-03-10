extends CharacterBody2D

var heart_points = 3
var speed = 300.0
var jump_velocity = -500.0
var animation
var animated_sprite
# @export var hp : PackedScene
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	animation = get_node("AnimatedSprite2D")
	animated_sprite = get_node("AnimatedSprite2D")
@onready var hp = get_node("hp/Hp")
func show_hp():
	# var hp_img = hp.instantiate()
	# add_child(hp_img)
	# hp_img.transform = $Node/Marker2D.global_transform

	print("player hp =", heart_points)
	if heart_points == 9:
		hp.play("9")
	elif heart_points == 2:
		hp.play("2")	
	elif heart_points == 1:
		hp.play("1")	
	elif heart_points == 0:
		hp.play("0")	

func _physics_process(delta):
	show_hp()
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * speed
		#print("direction == true")
		if direction == 1:
			animated_sprite.flip_h = false
		elif direction == -1:
			animated_sprite.flip_h = true
		if is_on_floor():
			#print("direction, is on floor")
			animation.play("run")
		else:
			#print("direction, not is on flor")
			animation.play("jump")
		
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		if is_on_floor():
			#print("direction != true")
			animation.play("idle")
		else:
			#print("not is on flor")
			animation.play("jump")

	move_and_slide()
