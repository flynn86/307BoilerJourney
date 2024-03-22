extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
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
			var format_string = "| Course Name: %s | Time: %s | Days: %s | Location: %s |\n"
			var actual_string = format_string % [courseName, courseTime, courseDays, courseLocation]
			complete_string += actual_string
	$Label.text = complete_string
			


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_add_pressed():
	get_tree().change_scene_to_file("res://scenes/addschedule.tscn")



