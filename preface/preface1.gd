extends Node2D
@onready var menu = Moving

# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.start('prefaceTimeline')
	Dialogic.signal_event.connect(_on_dialogic_signal)
	menu.visible = false

func _on_dialogic_signal(argument:String):
	if argument == "endPrefaceFirst":
		get_tree().change_scene_to_file("res://preface//preface2.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
