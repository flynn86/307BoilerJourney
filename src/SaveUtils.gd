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
		"purdue_symbol" : Attributes.purdue_symbol,
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
		"courseNames": Attributes.courseNames,
		"courseTimes": Attributes.courseTimes,
		"courseDays": Attributes.courseDays,
		"courseLocations": Attributes.courseLocations,
		"coursenum": Attributes.course_num
		
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
			Attributes.purdue_symbol = line["purdue_symbol"]
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
			Attributes.courseNames = line["courseNames"]
			Attributes.courseTimes = line["courseTimes"]
			Attributes.courseDays = line["courseDays"]
			Attributes.courseLocations = line["courseLocations"]
			Attributes.course_num = line["coursenum"] 
		file.close()

func delete(savefile: String):
	if FileAccess.file_exists(savefile):
		FileAccess.open(savefile, FileAccess.WRITE)
