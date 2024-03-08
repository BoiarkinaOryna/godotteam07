extends Area2D

@export_file("*.tscn") var next_level

func _on_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene_to_file(next_level)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

