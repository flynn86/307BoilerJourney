extends CanvasModulate

@export var gradient_texture:GradientTexture1D
#var time_state = 0 # 0 for day, 1 for night
#var time = 0.0

func _process(delta):
	if (Attributes.day_night_enabled):
		visible = true
		var time = GlobalTime.time
	
		var value = (sin(time - PI / 2.0) + 1.0) / 2.0
		self.color = gradient_texture.gradient.sample(value)
	else:
		visible = false
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#update_visibility()

#func update_visibility():
	#if time_state == 0:
		#visible = false
	#else:
		#visible = true

# Setter function to update time_state
#func set_time_state(new_state):
	#time_state = new_state
	#update_visibility()
	
# Getter function to get time_state
#func get_time_state():
	#return time_state
