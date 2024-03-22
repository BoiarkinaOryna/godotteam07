extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.start('prefaceTimeline3')
	Dialogic.signal_event.connect(_on_dialogic_signal)

func _on_dialogic_signal(argument:String):
	if argument == "endPrefaceThird":
		get_tree().change_scene_to_file("res://1Lvl/Lvl1.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
