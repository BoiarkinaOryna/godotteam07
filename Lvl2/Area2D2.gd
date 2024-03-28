extends Area2D
#var pause = false
@onready var menu = Moving
@onready var pause = $"../Player2/Pause"
@onready var door = $"../Door"
var flag = true
# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.signal_event.connect(_on_dialogic_signal)
func _on_dialogic_signal(argument:String):
	if argument == "endFairy_Principal2Lvl2":
		menu.visible = true
		pause.visible = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_body_entered(body):
	if body.name == "Player2":
		if flag:
			#pause = true
			menu.visible = false
			pause.visible = false
			door.visible = true
			#set_process(not is_processing())
			Dialogic.start("Fairy_Principal2Lvl2")
			flag = false
