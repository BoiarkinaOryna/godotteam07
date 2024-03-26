extends Area2D

var narrow_counter = 0
var narrow_flag = false

func _physics_process(_delta):
	if not self.scale.x >= 5:
		if not narrow_flag:
			self.scale.x += 0.1
			self.scale.y += 0.1
	if narrow_flag:
		self.scale.x -= 0.1
		self.scale.y -= 0.1
		if self.scale.x <= 1 and self.scale.y <= 1:
			self.scale.x = 0
			self.scale.y = 0
			queue_free()
	
	if self.scale.x >= 5 and self.scale.y >= 5:
		self.scale.x = 5
		self.scale.y = 5
		narrow_counter += 1
		
		if narrow_counter == 150:
			narrow_flag = true
