extends Area2D
var pause = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_body_entered(body):
	print(pause)
	if body.name == "Player1":
		pause = true
		#set_process(not is_processing())
		Dialogic.start("Principal_dialog")
