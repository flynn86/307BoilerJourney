extends Control

@onready var day_label_background = get_child(1).get_child(0)
@onready var day_label = day_label_background.get_child(0)
@onready var time_label_background = get_child(2).get_child(0)
@onready var time_label = time_label_background.get_child(0)
@onready var arrow = get_child(3)

func _process(_delta):
	set_daytime(GlobalTime.day,GlobalTime.hour, GlobalTime.minute)

func set_daytime(day: int, hour: int, minute: int):
	day_label.text = "Day " + str(day + 1)
	day_label_background.text = day_label.text
	var hour_str : String = ""
	var minute_str : String = ""
	var am_pm_str : String = ""
	
	if hour <= 12:
		hour_str = str(hour)
	elif hour > 12:
		hour_str = str(hour - 12)
	
	if minute < 10:
		minute_str = "0" + str(minute)
	else:
		minute_str = str(minute)
		
	if hour < 12:
		am_pm_str = "am"
	else:
		am_pm_str = "pm"
	
	time_label.text = hour_str + ":" + minute_str + " " + am_pm_str
	time_label_background.text = time_label.text
	
	# up = -90 deg
	# right = 0 deg
	# down = 90 deg
	# When going from night -> day, rotate arrow from up -> down
	# When going from day -> night, rotate arrow from down -> up
	if hour <= 12:
		arrow.rotation_degrees = _remap_rangef(hour, 0, 12, -90, 90)
		#arrow.rotation = ((float(hour) / 12) * 180) - 90
	else:
		arrow.rotation_degrees = _remap_rangef(hour, 13, 23, 90, -90)
		#arrow.rotation = ((float(hour - 13) / 10) * (-180)) + 90 
	
func _remap_rangef(input:float, minInput:float, maxInput:float, minOutput:float, maxOutput:float):
	return float(input - minInput) / float(maxInput - minInput) * float(maxOutput - minOutput) + minOutput
