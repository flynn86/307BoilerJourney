extends Node

var global_time = 6.0
var full_cycle_duration_seconds = 60

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var time_scale = 24.0 / full_cycle_duration_seconds
	global_time += delta * time_scale
	if global_time >= 24:
		global_time = 0.0
