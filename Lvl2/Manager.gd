extends Node
@onready var menu = Moving
var game_pause = false
@onready var pause_menu = $"../CanvasLayer/Control"
func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		game_pause = !game_pause
	if game_pause:
		get_tree().paused = true
		pause_menu.show()
	else:
		get_tree().paused = false
		pause_menu.hide()


func _on_resume_pressed():
	game_pause = false

func _on_quit_pressed():
	get_tree().paused = false
	game_pause = false
	menu.visible = false
	get_tree().change_scene_to_file("res://Menu/Menu.tscn")


func _on_treasure_pressed():
	Shop.lvl = get_parent().name
	get_tree().change_scene_to_file('res://Shop/Shop.tscn')
