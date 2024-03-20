extends Node

func save():
	var file = FileAccess.open(Attributes.filename, FileAccess.WRITE)
	var save_data: Dictionary = {
		#"xp" : Attributes.xp,
		"username" : Attributes.username,
		"xhousing" : Attributes.xhousing,
		"yhousing" : Attributes.yhousing,
		"xacademic" : Attributes.xacademic,
		"yacademic" : Attributes.yacademic,
		"location" : Attributes.location,
		"collectibleA" : Attributes.collectibleA,
		"collectibleH" : Attributes.collectibleH,
		"iu_poster" : Attributes.iu_poster,
		"hair" : Attributes.curr_hair,
		"body" : Attributes.curr_body,
		"eyes" : Attributes.curr_eyes,
		"outfit" : Attributes.curr_outfit,
		"filename" : Attributes.filename,
		"season" : Attributes.season,
		"isNight" : Attributes.night,
		"engineeringVisited" : Attributes.engineering_ftn_visited,
		"loebVisited": Attributes.loeb_ftn_visited,
		"quest1active" : Attributes.quest1_active,
		"quest1complete" : Attributes.quest1_completed,
		"quest2active" : Attributes.quest2_active,
		"quest2complete" : Attributes.quest2_completed,
		"quest3active" : Attributes.quest3_active,
		"quest3complete" : Attributes.quest3_completed,
		"course1name": Attributes.course1_name,
		"course3name": Attributes.course3_name,
		"course4name": Attributes.course4_name,
		"course5name": Attributes.course5_name,
		"course6name": Attributes.course6_name,
		"course7name": Attributes.course7_name,
		"course8name": Attributes.course8_name,
		"course2name": Attributes.course2_name,
		"course1days": Attributes.course1_days,
		"course2days": Attributes.course2_days,
		"course3days": Attributes.course3_days,
		"course4days": Attributes.course4_days,
		"course5days": Attributes.course5_days,
		"course6days": Attributes.course6_days,
		"course7days": Attributes.course7_days,
		"course8days": Attributes.course8_days,
		"course1time": Attributes.course1_time,
		"course2time": Attributes.course2_time,
		"course3time": Attributes.course3_time,
		"course4time": Attributes.course4_time,
		"course5time": Attributes.course5_time,
		"course6time": Attributes.course6_time,
		"course7time": Attributes.course7_time,
		"course8time": Attributes.course8_time,
		"course1location": Attributes.course1_location,
		"course2location": Attributes.course2_location,
		"course3location": Attributes.course3_location,
		"course4location": Attributes.course4_location,
		"course5location": Attributes.course5_location,
		"course6location": Attributes.course6_location,
		"course7location": Attributes.course7_location,
		"course8location": Attributes.course8_location,


		
	}
	var string_data = JSON.stringify(save_data)
	file.store_line(string_data)
	file.close()


func load(savefile: String):
	if FileAccess.file_exists(savefile):
		var file = FileAccess.open(savefile, FileAccess.READ)
		var line = JSON.parse_string(file.get_line())
		if line:
			#Attributes.xp = line["xp"]
			Attributes.username = line["username"]
			Attributes.xhousing = line["xhousing"]
			Attributes.yhousing = line["yhousing"]
			Attributes.xacademic = line["xacademic"]
			Attributes.yacademic = line["yacademic"]
			Attributes.location = line["location"]
			Attributes.collectibleA = line["collectibleA"]
			Attributes.collectibleH = line["collectibleH"]
			Attributes.iu_poster = line["iu_poster"]
			Attributes.curr_hair = line["hair"]
			Attributes.curr_body = line["body"]
			Attributes.curr_eyes = line["eyes"]
			Attributes.curr_outfit = line["outfit"]
			Attributes.filename = savefile
			Attributes.season = line["season"]
			Attributes.night = line["isNight"]
			Attributes.engineering_ftn_visited = line["engineeringVisited"]
			Attributes.loeb_ftn_visited = line["loebVisited"]
			Attributes.quest1_active = line["quest1active"]
			Attributes.quest1_completed = line["quest1complete"]
			Attributes.quest2_active = line["quest2active"]
			Attributes.quest2_completed = line["quest2complete"]
			Attributes.quest3_active = line["quest3active"]
			Attributes.quest3_completed = line["quest3complete"]
			Attributes.course1_name = line["course1name"]
			Attributes.course2_name = line["course2name"]
			Attributes.course3_name = line["course3name"]
			Attributes.course4_name = line["course4name"]
			Attributes.course5_name = line["course5name"]
			Attributes.course6_name = line["course6name"]
			Attributes.course7_name = line["course7name"]
			Attributes.course8_name = line["course8name"]
			Attributes.course1_days = line["course1days"]
			Attributes.course2_days = line["course2days"]
			Attributes.course3_days = line["course3days"]
			Attributes.course4_days = line["course4days"]
			Attributes.course5_days = line["course5days"]
			Attributes.course6_days = line["course6days"]
			Attributes.course7_days = line["course7days"]
			Attributes.course8_days = line["course8days"]
			Attributes.course1_time = line["course1time"]
			Attributes.course2_time = line["course2time"]
			Attributes.course3_time = line["course3time"]
			Attributes.course4_time = line["course4time"]
			Attributes.course5_time = line["course5time"]
			Attributes.course6_time = line["course6time"]
			Attributes.course7_time = line["course7time"]
			Attributes.course8_time = line["course8time"]
			Attributes.course1_location = line["course1location"]
			Attributes.course2_location = line["course2location"]
			Attributes.course3_location = line["course3location"]
			Attributes.course4_location = line["course4location"]
			Attributes.course5_location = line["course5location"]
			Attributes.course6_location = line["course6location"]
			Attributes.course7_location = line["course7location"]
			Attributes.course8_location = line["course8location"]
			
			
		file.close()

func delete(savefile: String):
	if FileAccess.file_exists(savefile):
		FileAccess.open(savefile, FileAccess.WRITE)
