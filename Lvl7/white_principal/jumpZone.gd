extends Area2D

@onready var player = $"../../Player7"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == 'Player7':
		if player.direction == -1:
			print('-1')
			player.velocity += Vector2(100000, 0)
		elif player.direction == 1:
			print('1')
			player.velocity -= Vector2(100000, 0)
