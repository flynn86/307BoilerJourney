extends Node2D

@export var dropdown_path:NodePath
@onready var dropdown = get_node(dropdown_path)

@onready var courseName_entry = $"Course Name"
@onready var courseTime_entry = $"Course Time"


# Called when the node enters the scene tree for the first time.
var building_list = ["ARMS", "PUSH", "HAMP", "PHYS", "RNPH", "JNSN", "FRNY", "DSCB", "MSEE", "CHAS", "BHEE", "AR", "ELLT", 
					"HOVD", "ME", "WALC", "POTR", "LMBS", "KNOY", "DUDL", "HAAS", "PSYC", "PRCE", "CL50", "MATH", "SC", 
					"WTHR", "BRWN", "HEAV", "GRIS", "BRNG", "SCHM", "UNIV", "MTHW", "STON", "STEW", "HIKS", "PMU", "OTHER"]


func _ready():
	add_items()
	var name = "course" + str(Attributes.course_num) + "_name"
	if Attributes.courseNames[name] != "":
		courseName_entry.text = Attributes.courseNames[name]
	var time = "course" + str(Attributes.course_num) + "_time"
	if Attributes.courseTimes[time] != 0:
		courseTime_entry.text = Attributes.courseTimes[time]
	var location = "course" + str(Attributes.course_num) + "_location"
	if (Attributes.courseLocations[location] != ""):
		dropdown.select(Attributes.courseLocations[location])


func add_items():
	for building in building_list:
		dropdown.add_item(building)


func _on_course_name_text_changed():
	pass # Replace with function body.


func _on_course_time_text_changed():
	pass # Replace with function body.


func _on_monday_pressed():
	var day = "course" + str(Attributes.course_num) + "_days"
	if (Attributes.courseDays[day]["M"] == 1) :
		Attributes.courseDays[day]["M"] = 0
	else :
		Attributes.courseDays[day]["M"] = 1



func _on_tuesday_pressed():
	var day = "course" + str(Attributes.course_num) + "_days"
	if (Attributes.courseDays[day]["T"] == 1) :
		Attributes.courseDays[day]["T"] = 0
	else :
		Attributes.courseDays[day]["T"] = 1


func _on_wednesday_pressed():
	var day = "course" + str(Attributes.course_num) + "_days"
	if (Attributes.courseDays[day]["W"] == 1) :
		Attributes.courseDays[day]["W"] = 0
	else :
		Attributes.courseDays[day]["W"] = 1


func _on_thursday_pressed():
	var day = "course" + str(Attributes.course_num) + "_days"
	if (Attributes.courseDays[day]["R"] == 1) :
		Attributes.courseDays[day]["R"] = 0
	else :
		Attributes.courseDays[day]["R"] = 1


func _on_friday_pressed():
	var day = "course" + str(Attributes.course_num) + "_days"
	if (Attributes.courseDays[day]["F"] == 1) :
		Attributes.courseDays[day]["F"] = 0
	else :
		Attributes.courseDays[day]["F"] = 1


func _on_submit_pressed():
	if courseName_entry.text == "" || courseTime_entry.text == "":
		$Label.visible = true
	else:
		var name = "course" + str(Attributes.course_num) + "_name"
		Attributes.courseNames[name] = courseName_entry.text
		var time = "course" + str(Attributes.course_num) + "_time"
		Attributes.courseTimes[time] = courseTime_entry.text
		var location = "course" + str(Attributes.course_num) + "_location"
		Attributes.courseLocations[location] = loc
		Attributes.course_num += 1
		SaveUtils.save()
		get_tree().change_scene_to_file("res://scenes/schedule.tscn")
		

var loc = "ARMS"
func _on_building_dropdown_item_selected(index):
	loc = str(dropdown.get_item_text(index))
