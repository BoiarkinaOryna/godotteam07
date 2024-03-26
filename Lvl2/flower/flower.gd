extends CharacterBody2D

var body_entered = false
var shoot_flag = false
var shoot_timeout_flag = false
var hp = 100
@export var bullet : PackedScene

func _ready():
	$Timer1.start()

func _on_detector_body_entered(body):
	if body.name == "Player2":
		body_entered = true

func _on_detector_body_exited(body):
	if body.name == "Player2":
		body_entered = false

func _on_timer_1_timeout():
	if body_entered:
		var bul = bullet.instantiate()
		bul.tsx = -1
		add_child(bul)
		bul.transform = $Node/Marker2D.global_transform
		
func _on_timer_2_timeout():
	if body_entered:
		var bul = bullet.instantiate()
		bul.tsx = 1
		add_child(bul)
		bul.transform = $Node/Marker2D.global_transform
	
func _physics_process(_delta):
	var player = $"../Player2"
	var direction = (player.position - self.position).normalized()
	$AnimatedSprite2D.flip_h = false
	#print(player.position)
	#print(self.position)
	
	if body_entered:
		if direction.x < 0:
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("attack")
			$Timer2.start()
			
		elif direction.x >= 0:
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("attack")
			$Timer1.start()
	else:
		$AnimatedSprite2D.play("idle")
	if hp <= 0:
		queue_free()
