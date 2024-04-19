extends Node2D

var frame_counter : int = 0
var flicker_start_frame : int = 120
var flicker_duration : int = 5
var max_energy : float = 0.6
var min_energy : float = 0.3

@onready var light = $PointLight2D

func _ready():
	frame_counter = 0
	visible = false

func _process(_delta):
	if (Attributes.day_night_enabled == false):
		visible = false
	elif (GlobalTime.hour >= 19) || (GlobalTime.hour <= 4):
		visible = true
		frame_counter += 1
		print(light.energy)
		if (frame_counter > flicker_start_frame + flicker_duration):
			light.energy = max_energy
			frame_counter = 0
			flicker_start_frame = randi_range(30, 1800)
			min_energy = randf_range(0.1, 0.4)
		elif (frame_counter >= flicker_start_frame):
			light.energy = min_energy
		else:
			light.energy = max_energy
	else:
		visible = false
