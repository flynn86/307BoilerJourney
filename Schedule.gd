extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label2.visible = false
	$Button1.visible = false
	$Button2.visible = false
	$Button3.visible = false
	$Button4.visible = false
	$Button5.visible = false
	$Button6.visible = false
	$Button7.visible = false
	$Button8.visible = false
	if (Attributes.course_num >= 2):
		$Button1.visible = true
	if (Attributes.course_num >= 3):
		$Button2.visible = true
	if (Attributes.course_num >= 4):
		$Button3.visible = true
	if (Attributes.course_num >= 5):
		$Button4.visible = true
	if (Attributes.course_num >= 6):
		$Button5.visible = true
	if (Attributes.course_num >= 7):
		$Button6.visible = true
	if (Attributes.course_num >= 8):
		$Button7.visible = true
	if (Attributes.course_num >= 9):
		$Button8.visible = true
	var complete_string = ""
	if (Attributes.course_num == 1) :
		complete_string = "No Courses Added yet. Please add a course first"
	else:
		for i in range (1, Attributes.course_num):
			var name = "course" + str(i) + "_name"
			var courseName = Attributes.courseNames[name]
			var time = "course" + str(i) + "_time"
			var courseTime = Attributes.courseTimes[time]
			var location = "course" + str(i) + "_location"
			var courseLocation = Attributes.courseLocations[location]
			var day = "course" + str(i) + "_days"
			var Days_dict = Attributes.courseDays[day]
			var courseDays = ""
			for j in Days_dict:
				if Days_dict[j] == 1:
					courseDays += j
			var format_string = "| Course Name: %s | Time: %s | Days: %s | Location: %s |\n\n"
			var actual_string = format_string % [courseName, courseTime, courseDays, courseLocation]
			complete_string += actual_string
	$Label.text = complete_string
			


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_add_pressed():
	if (Attributes.course_num >= 9):
		$Label2.visible = true
	else:
		get_tree().change_scene_to_file("res://scenes/addschedule.tscn")





func _on_go_back_to_map_pressed():
	get_tree().change_scene_to_file(Attributes.location)


func _on_button_1_pressed():
	var j = 1
	""" removing the course deleted"""
	var name = "course" + str(j) + "_name"
	Attributes.courseNames[name] = ""
	var time = "course" + str(j) + "_time"
	Attributes.courseTimes[time] = 0
	var location = "course" + str(j) + "_location"
	Attributes.courseLocations[location] = ""
	var day = "course" + str(j) + "_days"
	Attributes.courseDays[day] = {"M" : 0, "T" : 0, "W" : 0, "R" : 0, "F" : 0}
	for i in range (2, Attributes.course_num):
		name = "course" + str(i) + "_name"
		var namebefore = "course" + str(i-1) + "_name"
		Attributes.courseNames[namebefore] = Attributes.courseNames[name]
		Attributes.courseNames[name] = ""
		
		time = "course" + str(i) + "_time"
		var timebefore = "course" + str(i-1) + "_time"
		Attributes.courseTimes[timebefore] = Attributes.courseTimes[time]
		Attributes.courseTimes[time] = 0
		
		location = "course" + str(i) + "_location"
		var locationbefore = "course" + str(i-1) + "_location"
		Attributes.courseLocations[locationbefore] = Attributes.courseLocations[location] 
		Attributes.courseLocations[location] = ""
		
		day = "course" + str(i) + "_days"
		var daybefore = "course" + str(i-1) + "_days"
		Attributes.courseDays[daybefore] = Attributes.courseDays[day]
		Attributes.courseDays[day] = {"M" : 0, "T" : 0, "W" : 0, "R" : 0, "F" : 0}
	Attributes.course_num = Attributes.course_num - 1
	SaveUtils.save()
	get_tree().change_scene_to_file("res://scenes/schedule.tscn")



func _on_button_2_pressed():
	var j = 2
	""" removing the course deleted"""
	var name = "course" + str(j) + "_name"
	Attributes.courseNames[name] = ""
	var time = "course" + str(j) + "_time"
	Attributes.courseTimes[time] = 0
	var location = "course" + str(j) + "_location"
	Attributes.courseLocations[location] = ""
	var day = "course" + str(j) + "_days"
	Attributes.courseDays[day] = {"M" : 0, "T" : 0, "W" : 0, "R" : 0, "F" : 0}
	for i in range (3, Attributes.course_num):
		name = "course" + str(i) + "_name"
		var namebefore = "course" + str(i-1) + "_name"
		Attributes.courseNames[namebefore] = Attributes.courseNames[name]
		Attributes.courseNames[name] = ""
		
		time = "course" + str(i) + "_time"
		var timebefore = "course" + str(i-1) + "_time"
		Attributes.courseTimes[timebefore] = Attributes.courseTimes[time]
		Attributes.courseTimes[time] = 0
		
		location = "course" + str(i) + "_location"
		var locationbefore = "course" + str(i-1) + "_location"
		Attributes.courseLocations[locationbefore] = Attributes.courseLocations[location] 
		Attributes.courseLocations[location] = ""
		
		day = "course" + str(i) + "_days"
		var daybefore = "course" + str(i-1) + "_days"
		Attributes.courseDays[daybefore] = Attributes.courseDays[day]
		Attributes.courseDays[day] = {"M" : 0, "T" : 0, "W" : 0, "R" : 0, "F" : 0}
	Attributes.course_num = Attributes.course_num - 1
	SaveUtils.save()
	get_tree().change_scene_to_file("res://scenes/schedule.tscn")


func _on_button_3_pressed():
	var j = 3
	""" removing the course deleted"""
	var name = "course" + str(j) + "_name"
	Attributes.courseNames[name] = ""
	var time = "course" + str(j) + "_time"
	Attributes.courseTimes[time] = 0
	var location = "course" + str(j) + "_location"
	Attributes.courseLocations[location] = ""
	var day = "course" + str(j) + "_days"
	Attributes.courseDays[day] = {"M" : 0, "T" : 0, "W" : 0, "R" : 0, "F" : 0}
	for i in range (4, Attributes.course_num):
		name = "course" + str(i) + "_name"
		var namebefore = "course" + str(i-1) + "_name"
		Attributes.courseNames[namebefore] = Attributes.courseNames[name]
		Attributes.courseNames[name] = ""
		
		time = "course" + str(i) + "_time"
		var timebefore = "course" + str(i-1) + "_time"
		Attributes.courseTimes[timebefore] = Attributes.courseTimes[time]
		Attributes.courseTimes[time] = 0
		
		location = "course" + str(i) + "_location"
		var locationbefore = "course" + str(i-1) + "_location"
		Attributes.courseLocations[locationbefore] = Attributes.courseLocations[location] 
		Attributes.courseLocations[location] = ""
		
		day = "course" + str(i) + "_days"
		var daybefore = "course" + str(i-1) + "_days"
		Attributes.courseDays[daybefore] = Attributes.courseDays[day]
		Attributes.courseDays[day] = {"M" : 0, "T" : 0, "W" : 0, "R" : 0, "F" : 0}
	Attributes.course_num = Attributes.course_num - 1
	SaveUtils.save()
	get_tree().change_scene_to_file("res://scenes/schedule.tscn")


func _on_button_4_pressed():
	var j = 4
	""" removing the course deleted"""
	var name = "course" + str(j) + "_name"
	Attributes.courseNames[name] = ""
	var time = "course" + str(j) + "_time"
	Attributes.courseTimes[time] = 0
	var location = "course" + str(j) + "_location"
	Attributes.courseLocations[location] = ""
	var day = "course" + str(j) + "_days"
	Attributes.courseDays[day] = {"M" : 0, "T" : 0, "W" : 0, "R" : 0, "F" : 0}
	for i in range (5, Attributes.course_num):
		name = "course" + str(i) + "_name"
		var namebefore = "course" + str(i-1) + "_name"
		Attributes.courseNames[namebefore] = Attributes.courseNames[name]
		Attributes.courseNames[name] = ""
		
		time = "course" + str(i) + "_time"
		var timebefore = "course" + str(i-1) + "_time"
		Attributes.courseTimes[timebefore] = Attributes.courseTimes[time]
		Attributes.courseTimes[time] = 0
		
		location = "course" + str(i) + "_location"
		var locationbefore = "course" + str(i-1) + "_location"
		Attributes.courseLocations[locationbefore] = Attributes.courseLocations[location] 
		Attributes.courseLocations[location] = ""
		
		day = "course" + str(i) + "_days"
		var daybefore = "course" + str(i-1) + "_days"
		Attributes.courseDays[daybefore] = Attributes.courseDays[day]
		Attributes.courseDays[day] = {"M" : 0, "T" : 0, "W" : 0, "R" : 0, "F" : 0}
	Attributes.course_num = Attributes.course_num - 1
	SaveUtils.save()
	get_tree().change_scene_to_file("res://scenes/schedule.tscn")


func _on_button_5_pressed():
	var j = 5
	""" removing the course deleted"""
	var name = "course" + str(j) + "_name"
	Attributes.courseNames[name] = ""
	var time = "course" + str(j) + "_time"
	Attributes.courseTimes[time] = 0
	var location = "course" + str(j) + "_location"
	Attributes.courseLocations[location] = ""
	var day = "course" + str(j) + "_days"
	Attributes.courseDays[day] = {"M" : 0, "T" : 0, "W" : 0, "R" : 0, "F" : 0}
	for i in range (6, Attributes.course_num):
		name = "course" + str(i) + "_name"
		var namebefore = "course" + str(i-1) + "_name"
		Attributes.courseNames[namebefore] = Attributes.courseNames[name]
		Attributes.courseNames[name] = ""
		
		time = "course" + str(i) + "_time"
		var timebefore = "course" + str(i-1) + "_time"
		Attributes.courseTimes[timebefore] = Attributes.courseTimes[time]
		Attributes.courseTimes[time] = 0
		
		location = "course" + str(i) + "_location"
		var locationbefore = "course" + str(i-1) + "_location"
		Attributes.courseLocations[locationbefore] = Attributes.courseLocations[location] 
		Attributes.courseLocations[location] = ""
		
		day = "course" + str(i) + "_days"
		var daybefore = "course" + str(i-1) + "_days"
		Attributes.courseDays[daybefore] = Attributes.courseDays[day]
		Attributes.courseDays[day] = {"M" : 0, "T" : 0, "W" : 0, "R" : 0, "F" : 0}
	Attributes.course_num = Attributes.course_num - 1
	SaveUtils.save()
	get_tree().change_scene_to_file("res://scenes/schedule.tscn")


func _on_button_6_pressed():
	var j = 6
	""" removing the course deleted"""
	var name = "course" + str(j) + "_name"
	Attributes.courseNames[name] = ""
	var time = "course" + str(j) + "_time"
	Attributes.courseTimes[time] = 0
	var location = "course" + str(j) + "_location"
	Attributes.courseLocations[location] = ""
	var day = "course" + str(j) + "_days"
	Attributes.courseDays[day] = {"M" : 0, "T" : 0, "W" : 0, "R" : 0, "F" : 0}
	for i in range (7, Attributes.course_num):
		name = "course" + str(i) + "_name"
		var namebefore = "course" + str(i-1) + "_name"
		Attributes.courseNames[namebefore] = Attributes.courseNames[name]
		Attributes.courseNames[name] = ""
		
		time = "course" + str(i) + "_time"
		var timebefore = "course" + str(i-1) + "_time"
		Attributes.courseTimes[timebefore] = Attributes.courseTimes[time]
		Attributes.courseTimes[time] = 0
		
		location = "course" + str(i) + "_location"
		var locationbefore = "course" + str(i-1) + "_location"
		Attributes.courseLocations[locationbefore] = Attributes.courseLocations[location] 
		Attributes.courseLocations[location] = ""
		
		day = "course" + str(i) + "_days"
		var daybefore = "course" + str(i-1) + "_days"
		Attributes.courseDays[daybefore] = Attributes.courseDays[day]
		Attributes.courseDays[day] = {"M" : 0, "T" : 0, "W" : 0, "R" : 0, "F" : 0}
	Attributes.course_num = Attributes.course_num - 1
	SaveUtils.save()
	get_tree().change_scene_to_file("res://scenes/schedule.tscn")


func _on_button_7_pressed():
	var j = 7
	""" removing the course deleted"""
	var name = "course" + str(j) + "_name"
	Attributes.courseNames[name] = ""
	var time = "course" + str(j) + "_time"
	Attributes.courseTimes[time] = 0
	var location = "course" + str(j) + "_location"
	Attributes.courseLocations[location] = ""
	var day = "course" + str(j) + "_days"
	Attributes.courseDays[day] = {"M" : 0, "T" : 0, "W" : 0, "R" : 0, "F" : 0}
	for i in range (8, Attributes.course_num):
		name = "course" + str(i) + "_name"
		var namebefore = "course" + str(i-1) + "_name"
		Attributes.courseNames[namebefore] = Attributes.courseNames[name]
		Attributes.courseNames[name] = ""
		
		time = "course" + str(i) + "_time"
		var timebefore = "course" + str(i-1) + "_time"
		Attributes.courseTimes[timebefore] = Attributes.courseTimes[time]
		Attributes.courseTimes[time] = 0
		
		location = "course" + str(i) + "_location"
		var locationbefore = "course" + str(i-1) + "_location"
		Attributes.courseLocations[locationbefore] = Attributes.courseLocations[location] 
		Attributes.courseLocations[location] = ""
		
		day = "course" + str(i) + "_days"
		var daybefore = "course" + str(i-1) + "_days"
		Attributes.courseDays[daybefore] = Attributes.courseDays[day]
		Attributes.courseDays[day] = {"M" : 0, "T" : 0, "W" : 0, "R" : 0, "F" : 0}
	Attributes.course_num = Attributes.course_num - 1
	SaveUtils.save()
	get_tree().change_scene_to_file("res://scenes/schedule.tscn")


func _on_button_8_pressed():
	var j = 8
	""" removing the course deleted"""
	var name = "course" + str(j) + "_name"
	Attributes.courseNames[name] = ""
	var time = "course" + str(j) + "_time"
	Attributes.courseTimes[time] = 0
	var location = "course" + str(j) + "_location"
	Attributes.courseLocations[location] = ""
	var day = "course" + str(j) + "_days"
	Attributes.courseDays[day] = {"M" : 0, "T" : 0, "W" : 0, "R" : 0, "F" : 0}
	for i in range (9, Attributes.course_num):
		name = "course" + str(i) + "_name"
		var namebefore = "course" + str(i-1) + "_name"
		Attributes.courseNames[namebefore] = Attributes.courseNames[name]
		Attributes.courseNames[name] = ""
		
		time = "course" + str(i) + "_time"
		var timebefore = "course" + str(i-1) + "_time"
		Attributes.courseTimes[timebefore] = Attributes.courseTimes[time]
		Attributes.courseTimes[time] = 0
		
		location = "course" + str(i) + "_location"
		var locationbefore = "course" + str(i-1) + "_location"
		Attributes.courseLocations[locationbefore] = Attributes.courseLocations[location] 
		Attributes.courseLocations[location] = ""
		
		day = "course" + str(i) + "_days"
		var daybefore = "course" + str(i-1) + "_days"
		Attributes.courseDays[daybefore] = Attributes.courseDays[day]
		Attributes.courseDays[day] = {"M" : 0, "T" : 0, "W" : 0, "R" : 0, "F" : 0}
	Attributes.course_num = Attributes.course_num - 1
	SaveUtils.save()
	get_tree().change_scene_to_file("res://scenes/schedule.tscn")
