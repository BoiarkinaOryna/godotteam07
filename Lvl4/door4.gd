extends Area2D

@export_file("*.tscn") var next_level
var flag_portal_entered = false
#
func _on_body_entered(body):
	if body.name == "Player4":
		flag_portal_entered = true
		#
		#
## Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if flag_portal_entered == true:
		get_tree().change_scene_to_file("res://Lvl5/Lvl5.tscn")
