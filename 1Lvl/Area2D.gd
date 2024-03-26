extends Area2D
#var pause = false
@onready var menu = $"../Player1/Moving"
@onready var pause = $"../Player1/Pause"
@onready var door = $"../Door"
var flag = true
# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.signal_event.connect(_on_dialogic_signal)
#endPrincipalDialogFirstLvl
func _on_dialogic_signal(argument:String):
	if argument == "endGossipersDialogic1LVL":
		menu.visible = true
		pause.visible = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_body_entered(body):
	if body.name == "Player1":
		if flag:
			#pause = true
			menu.visible = false
			pause.visible = false
			door.visible = true
			#set_process(not is_processing())
			Dialogic.start("timeline")
			flag = false
