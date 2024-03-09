extends CharacterBody2D


var speed = 300.0
const JUMP_VELOCITY = -500.0
var animation
var animated_sprite

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	animation = get_node("AnimatedSprite2D")
	animated_sprite = get_node("AnimatedSprite2D")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

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
