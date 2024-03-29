extends Node

func save():
	(Attributes.database).update_rows("Players", "username == '%s'" % Attributes.username, {
		"username" = Attributes.username,
		"xp" = Attributes.xp,
		"rank" = Attributes.rank,
		"serverName" = Attributes.serverName,
		"isHost" = Attributes.isHost
	})
	var file = FileAccess.open(Attributes.filename, FileAccess.WRITE)
	var save_data: Dictionary = {
		"xp" : Attributes.xp,
		"username" : Attributes.username,
		"xhousing" : Attributes.xhousing,
		"yhousing" : Attributes.yhousing,
		"xacademic" : Attributes.xacademic,
		"yacademic" : Attributes.yacademic,
		"location" : Attributes.location,
		"rank" : Attributes.rank,
		
		# collectables
		
		"numCollected" : Attributes.numCollected,
		"angry_pete" : Attributes.angry_pete,
		"basketball" : Attributes.basketball,
		"bell_tower" : Attributes.bell_tower,
		"boilermaker_train" : Attributes.boilermaker_train,
		"go_boilers" : Attributes.go_boilers,
		"iu_poster" : Attributes.iu_poster,
		"purdue_cap" : Attributes.purdue_cap,
		"purdue_helmet" : Attributes.purdue_helmet,
		"purdue_symbol" : Attributes.purdue_symbol,
		"dorm_display" : Attributes.dorm_display,
		"display_item_number" : Attributes.display_item_number,
		"display_item_1" : Attributes.display_item_1,
		"display_item_2" : Attributes.display_item_2,
		"display_item_3" : Attributes.display_item_3,
		
		"bed" : Attributes.curr_bed,
		"desk" : Attributes.curr_desk,
		"sidetable" : Attributes.curr_sidetable,
		"window" : Attributes.curr_window,
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
		"basics_shown" : Attributes.basics_shown,
		"courseNames": Attributes.courseNames,
		"courseTimes": Attributes.courseTimes,
		"courseDays": Attributes.courseDays,
		"courseLocations": Attributes.courseLocations,
		"coursenum": Attributes.course_num,
		# Inventory
		"items": Attributes.items,
		# Daily Question
		"question_available" : Attributes.question_available,
		"last_daily_question_time" : Attributes.last_daily_question_time,
		
		# Time and Day/Night Cycle
		"time" : Attributes.time,
		"day_night_enabled" : Attributes.day_night_enabled
	}
	var string_data = JSON.stringify(save_data)
	file.store_line(string_data)
	file.close()


func load(savefile: String):
	if FileAccess.file_exists(savefile):
		var file = FileAccess.open(savefile, FileAccess.READ)
		var line = JSON.parse_string(file.get_line())
		if line:
			Attributes.xp = line["xp"]
			Attributes.username = line["username"]
			Attributes.xhousing = line["xhousing"]
			Attributes.yhousing = line["yhousing"]
			Attributes.xacademic = line["xacademic"]
			Attributes.yacademic = line["yacademic"]
			Attributes.location = line["location"]
			Attributes.rank = line["rank"]
			var player : Array = (Attributes.database).select_rows("Players", "username == '%s'" % Attributes.username, ["*"])
			if (player.size() != 0):
				Attributes.serverName = player[0].serverName
				Attributes.isHost = player[0].isHost
			else:
				# this shouldn't happen if player table is managed correctly
				Attributes.serverName = ""
				Attributes.isHost = false
			
			# collectables
			
			Attributes.numCollected = line["numCollected"]
			Attributes.angry_pete = line["angry_pete"]
			Attributes.basketball = line["basketball"]
			Attributes.bell_tower = line["bell_tower"]
			Attributes.boilermaker_train = line["boilermaker_train"]
			Attributes.go_boilers = line["go_boilers"]
			Attributes.iu_poster = line["iu_poster"]
			Attributes.purdue_cap = line["purdue_cap"]
			Attributes.purdue_helmet = line["purdue_helmet"]
			Attributes.purdue_symbol = line["purdue_symbol"]
			Attributes.dorm_display = line["dorm_display"]
			Attributes.display_item_number = line["display_item_number"]
			Attributes.display_item_1 = line["display_item_1"]
			Attributes.display_item_2 = line["display_item_2"]
			Attributes.display_item_3 = line["display_item_3"]
			
			Attributes.curr_bed = line["bed"]
			Attributes.curr_desk = line["desk"]
			Attributes.curr_window = line["window"]
			Attributes.curr_sidetable = line["sidetable"]
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
			Attributes.basics_shown = line["basics_shown"]
			Attributes.courseNames = line["courseNames"]
			Attributes.courseTimes = line["courseTimes"]
			Attributes.courseDays = line["courseDays"]
			Attributes.courseLocations = line["courseLocations"]
			Attributes.course_num = line["coursenum"] 
			# Inventory
			Attributes.items = line["items"]
			# Daily Question
			Attributes.question_available = line["question_available"]
			Attributes.last_daily_question_time = line["last_daily_question_time"]
			
			# Time and Day/Night
			Attributes.time = line["time"]
			Attributes.day_night_enabled = line["day_night_enabled"]
		file.close()

func delete(savefile: String):
	if FileAccess.file_exists(savefile):
		FileAccess.open(savefile, FileAccess.WRITE)
