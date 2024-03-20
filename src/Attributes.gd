extends Node

#var xp: int = 0
var username: String = ""
var xhousing: float = float(256)
var yhousing: float = float(256)
var xacademic: float = float(-855.100219726562)
var yacademic: float = float(-1381.95544433594)
var xPMU: float = float(3250)
var yPMU: float = float(830)
var location: String = "res://scenes/map/academic_map.tscn"

# collectables

var collectibleA: bool = false
var collectibleH: bool = false
var iu_poster: bool = false
var purdue_symbol: bool = false
var basketball: bool = false

var curr_hair: int = 0
var curr_eyes: int = 0
var curr_body: int = 0
var curr_outfit: int = 0
var filename: String = "res://savefiles/save1.bin"
var season: String = "Summer"
var night: bool = false
var PMU_renter: bool = false
var engineering_ftn_visited: bool = false
var loeb_ftn_visited: bool = false
var quest1_active: bool = false
var quest1_completed: bool = false
var quest2_active: bool = false
var quest2_completed: bool = false
var quest3_active: bool = false
var quest3_completed: bool = false
'''
var course1_name: String = ""
var course2_name: String = ""
var course3_name: String = ""
var course4_name: String = ""
var course5_name: String = ""
var course6_name: String = ""
var course7_name: String = ""
var course8_name: String = ""
var course1_time: int = 0
var course2_time: int = 0
var course3_time: int = 0
var course4_time: int = 0
var course5_time: int = 0
var course6_time: int = 0
var course7_time: int = 0
var course8_time: int = 0
var course1_location: String = ""
var course2_location: String = ""
var course3_location: String = ""
var course4_location: String = ""
var course5_location: String = ""
var course6_location: String = ""
var course7_location: String = ""
var course8_location: String = ""
var course1_days: String = ""
var course2_days: String = ""
var course3_days: String = ""
var course4_days: String = ""
var course5_days: String = ""
var course6_days: String = ""
var course7_days: String = ""
var course8_days: String = ""
'''
var courseNames: Dictionary = {
	"course1_name" : "",
	"course2_name" : "",
	"course3_name" : "",
	"course4_name" : "",
	"course5_name" : "",
	"course6_name" : "",
	"course7_name" : "",
	"course8_name" : ""
}

var courseTimes: Dictionary = {
	"course1_time" : 0,
	"course2_time" : 0,
	"course3_time" : 0,
	"course4_time" : 0,
	"course5_time" : 0,
	"course6_time" : 0,
	"course7_time" : 0,
	"course8_time" : 0
}

var courseDays: Dictionary = {
	"course1_days" : {"M" : 0, "T" : 0, "W" : 0, "R" : 0, "F" : 0},
	"course2_days" : {"M" : 0, "T" : 0, "W" : 0, "R" : 0, "F" : 0},
	"course3_days" : {"M" : 0, "T" : 0, "W" : 0, "R" : 0, "F" : 0},
	"course4_days" : {"M" : 0, "T" : 0, "W" : 0, "R" : 0, "F" : 0},
	"course5_days" : {"M" : 0, "T" : 0, "W" : 0, "R" : 0, "F" : 0},
	"course6_days" : {"M" : 0, "T" : 0, "W" : 0, "R" : 0, "F" : 0},
	"course7_days" : {"M" : 0, "T" : 0, "W" : 0, "R" : 0, "F" : 0},
	"course8_days" : {"M" : 0, "T" : 0, "W" : 0, "R" : 0, "F" : 0}
}
var courseLocations: Dictionary = {
	"course1_location" : "",
	"course2_location" : "",
	"course3_location" : "",
	"course4_location" : "",
	"course5_location" : "",
	"course6_location" : "",
	"course7_location" : "",
	"course8_location" : ""
}
var course_num: int = 1





#var walk_right: AnimationPlayer

func reset(file: String):
	username = ""
	xhousing = float(256)
	yhousing = float(256)
	xacademic = float(-855.100219726562)
	yacademic = float(-1381.95544433594)
	xPMU = float(3250)
	yPMU = (830)
	location = "res://scenes/map/academic_map.tscn"
	
	# collectables
	
	collectibleA = false
	collectibleH = false
	iu_poster = false
	purdue_symbol = false
	basketball = false
	
	curr_hair = 0
	curr_eyes = 0
	curr_body = 0
	curr_outfit = 0
	filename = file
	season = "Summer"
	night = false
	PMU_renter = false
	engineering_ftn_visited = false
	loeb_ftn_visited = false
	var quest1_active = false
	var quest1_completed = false
	var quest2_active = false
	var quest2_completed = false
	var quest3_active = false
	var quest3_completed = false
	'''
	course1_name = ""
	course2_name = ""
	course3_name = ""
	course4_name = ""
	course5_name = ""
	course6_name = ""
	course7_name = ""
	course8_name = ""
	course1_time = 0
	course2_time = 0
	course3_time = 0
	course4_time = 0
	course5_time = 0
	course6_time = 0
	course7_time = 0
	course8_time = 0
	course1_location = ""
	course2_location = ""
	course3_location = ""
	course4_location = ""
	course5_location = ""
	course6_location = ""
	course7_location = ""
	course8_location = ""
	course1_days = ""
	course2_days = ""
	course3_days = ""
	course4_days = ""
	course5_days = ""
	course6_days = ""
	course7_days = ""
	course8_days = ""
	'''
	courseNames = {
		"course1_name" : "",
		"course2_name" : "",
		"course3_name" : "",
		"course4_name" : "",
		"course5_name" : "",
		"course6_name" : "",
		"course7_name" : "",
		"course8_name" : ""
	}
	courseTimes = {
		"course1_time" : 0,
		"course2_time" : 0,
		"course3_time" : 0,
		"course4_time" : 0,
		"course5_time" : 0,
		"course6_time" : 0,
		"course7_time" : 0,
		"course8_time" : 0
	}
	courseDays = {
		"course1_days" : {"M" : 0, "T" : 0, "W" : 0, "R" : 0, "F" : 0},
		"course2_days" : {"M" : 0, "T" : 0, "W" : 0, "R" : 0, "F" : 0},
		"course3_days" : {"M" : 0, "T" : 0, "W" : 0, "R" : 0, "F" : 0},
		"course4_days" : {"M" : 0, "T" : 0, "W" : 0, "R" : 0, "F" : 0},
		"course5_days" : {"M" : 0, "T" : 0, "W" : 0, "R" : 0, "F" : 0},
		"course6_days" : {"M" : 0, "T" : 0, "W" : 0, "R" : 0, "F" : 0},
		"course7_days" : {"M" : 0, "T" : 0, "W" : 0, "R" : 0, "F" : 0},
		"course8_days" : {"M" : 0, "T" : 0, "W" : 0, "R" : 0, "F" : 0}
	}
	courseLocations = {
		"course1_location" : "",
		"course2_location" : "",
		"course3_location" : "",
		"course4_location" : "",
		"course5_location" : "",
		"course6_location" : "",
		"course7_location" : "",
		"course8_location" : ""
	}
	course_num = 1
	
	
