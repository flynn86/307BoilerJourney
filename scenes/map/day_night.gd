extends CanvasModulate

var gt = preload("res://GlobalTime.gd").new()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var time_of_day = fmod(gt.global_time, 24.0)

	if (time_of_day >= 6.0 and time_of_day < 18.0):
		visible = false
	else:
		visible = true
