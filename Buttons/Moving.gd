extends CanvasLayer
#var gray = get_node('/root/Moving').find_node('hit')
#var menu = get_parent()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#print(fire)
	#print(gray)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#print(visible)
	visible = Moving.visible
	#print(gray.visible)
	#asdgasdray = Moviasdngasd.gray
