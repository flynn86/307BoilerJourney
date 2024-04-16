extends Node

func initialize():
	var data = {
		"xp" = Attributes.xp,
		"username" = Attributes.username,
		"xhousing" = Attributes.xhousing,
		"yhousing" = Attributes.yhousing,
		"xacademic" = Attributes.xacademic,
		"yacademic" = Attributes.yacademic,
		"location" = Attributes.location,
		"rank" = Attributes.rank,
		"serverName" = Attributes.serverName,
		"isHost" = Attributes.isHost,
		"currentRest" = Attributes.currentRest,
		# collectables
		
		"numCollected" = Attributes.numCollected,
		"angry_pete" = Attributes.angry_pete,
		"basketball" = Attributes.basketball,
		"bell_tower" = Attributes.bell_tower,
		"boilermaker_train" = Attributes.boilermaker_train,
		"go_boilers" = Attributes.go_boilers,
		"iu_poster" = Attributes.iu_poster,
		"purdue_cap" = Attributes.purdue_cap,
		"purdue_helmet" = Attributes.purdue_helmet,
		"purdue_symbol" = Attributes.purdue_symbol,
		"dorm_display" = Attributes.dorm_display,
		"display_item_number" = Attributes.display_item_number,
		"display_item_1" = Attributes.display_item_1,
		"display_item_2" = Attributes.display_item_2,
		"display_item_3" = Attributes.display_item_3,
		
		"bed" = Attributes.curr_bed,
		"desk" = Attributes.curr_desk,
		"sidetable" = Attributes.curr_sidetable,
		"window" = Attributes.curr_window,
		"hair" = Attributes.curr_hair,
		"body" = Attributes.curr_body,
		"eyes" = Attributes.curr_eyes,
		"outfit" = Attributes.curr_outfit,
		"season" = Attributes.season,
		"isNight" = Attributes.night,
		"engineeringVisited" = Attributes.engineering_ftn_visited,
		"loebVisited"= Attributes.loeb_ftn_visited,
		"quest1active" = Attributes.quest1_active,
		"quest1complete" = Attributes.quest1_completed,
		"quest2active" = Attributes.quest2_active,
		"quest2complete" = Attributes.quest2_completed,
		"quest3active" = Attributes.quest3_active,
		"quest3complete" = Attributes.quest3_completed,
		"basics_shown" = Attributes.basics_shown,
		"course1_name" = Attributes.courseNames["course1_name"],
		"course2_name" = Attributes.courseNames["course2_name"],
		"course3_name" = Attributes.courseNames["course3_name"],
		"course4_name" = Attributes.courseNames["course4_name"],
		"course5_name" = Attributes.courseNames["course5_name"],
		"course6_name" = Attributes.courseNames["course6_name"],
		"course7_name" = Attributes.courseNames["course7_name"],
		"course8_name" = Attributes.courseNames["course8_name"],
		"course1_time" = Attributes.courseTimes["course1_time"],
		"course2_time" = Attributes.courseTimes["course2_time"],
		"course3_time" = Attributes.courseTimes["course3_time"],
		"course4_time" = Attributes.courseTimes["course4_time"],
		"course5_time" = Attributes.courseTimes["course5_time"],
		"course6_time" = Attributes.courseTimes["course6_time"],
		"course7_time" = Attributes.courseTimes["course7_time"],
		"course8_time" = Attributes.courseTimes["course8_time"],
		"course1_days" = 16*Attributes.courseDays["course1_days"]["M"] + 8*Attributes.courseDays["course1_days"]["T"] + 4*Attributes.courseDays["course1_days"]["W"] + 2*Attributes.courseDays["course1_days"]["R"] +  Attributes.courseDays["course1_days"]["F"],
		"course2_days" = 16*Attributes.courseDays["course2_days"]["M"] + 8*Attributes.courseDays["course2_days"]["T"] + 4*Attributes.courseDays["course2_days"]["W"] + 2*Attributes.courseDays["course2_days"]["R"] +  Attributes.courseDays["course2_days"]["F"],
		"course3_days" = 16*Attributes.courseDays["course3_days"]["M"] + 8*Attributes.courseDays["course3_days"]["T"] + 4*Attributes.courseDays["course3_days"]["W"] + 2*Attributes.courseDays["course3_days"]["R"] +  Attributes.courseDays["course3_days"]["F"],
		"course4_days" = 16*Attributes.courseDays["course4_days"]["M"] + 8*Attributes.courseDays["course4_days"]["T"] + 4*Attributes.courseDays["course4_days"]["W"] + 2*Attributes.courseDays["course4_days"]["R"] +  Attributes.courseDays["course4_days"]["F"],
		"course5_days" = 16*Attributes.courseDays["course5_days"]["M"] + 8*Attributes.courseDays["course5_days"]["T"] + 4*Attributes.courseDays["course5_days"]["W"] + 2*Attributes.courseDays["course5_days"]["R"] +  Attributes.courseDays["course5_days"]["F"],
		"course6_days" = 16*Attributes.courseDays["course6_days"]["M"] + 8*Attributes.courseDays["course6_days"]["T"] + 4*Attributes.courseDays["course6_days"]["W"] + 2*Attributes.courseDays["course6_days"]["R"] +  Attributes.courseDays["course6_days"]["F"],
		"course7_days" = 16*Attributes.courseDays["course7_days"]["M"] + 8*Attributes.courseDays["course7_days"]["T"] + 4*Attributes.courseDays["course7_days"]["W"] + 2*Attributes.courseDays["course7_days"]["R"] +  Attributes.courseDays["course7_days"]["F"],
		"course8_days" = 16*Attributes.courseDays["course8_days"]["M"] + 8*Attributes.courseDays["course8_days"]["T"] + 4*Attributes.courseDays["course8_days"]["W"] + 2*Attributes.courseDays["course8_days"]["R"] +  Attributes.courseDays["course8_days"]["F"],
		"course1_location" = Attributes.courseLocations["course1_location"],
		"course2_location" = Attributes.courseLocations["course2_location"],
		"course3_location" = Attributes.courseLocations["course3_location"],
		"course4_location" = Attributes.courseLocations["course4_location"],
		"course5_location" = Attributes.courseLocations["course5_location"],
		"course6_location" = Attributes.courseLocations["course6_location"],
		"course7_location" = Attributes.courseLocations["course7_location"],
		"course8_location" = Attributes.courseLocations["course8_location"],
		"coursenum" = Attributes.course_num,
		# Daily Question
		"question_available" = Attributes.question_available,
		"last_daily_question_time" = "" if (Attributes.last_daily_question_time.is_empty()) else Time.get_datetime_string_from_datetime_dict(Attributes.last_daily_question_time, false),
		# Time and Day/Night Cycle
		"time" = Attributes.time,
		"day_night_enabled" = Attributes.day_night_enabled,
		"interest_1" = Attributes.interest_1,
		"interest_2" = Attributes.interest_2,
		"interest_3" = Attributes.interest_3,
		# Togglable UI
		"day_night_ui_toggle" = Attributes.day_night_ui_toggle,
		"ui_toggle_1" = Attributes.ui_toggle_1,
		"ui_toggle_2" = Attributes.ui_toggle_2,
		"minimap_toggle" = Attributes.minimap_toggle,
		"trade_req" = Attributes.trade_req,
		"trade_sender" = Attributes.trade_sender,
		"trade_receiver" = Attributes.trade_receiver
	}
	(Attributes.database).insert_row("Players", data)

func save():
	(Attributes.database).update_rows("Players", "username == '%s'" % Attributes.username, {
		"xp" = Attributes.xp,
		"username" = Attributes.username,
		"xhousing" = Attributes.xhousing,
		"yhousing" = Attributes.yhousing,
		"xacademic" = Attributes.xacademic,
		"yacademic" = Attributes.yacademic,
		"location" = Attributes.location,
		"rank" = Attributes.rank,
		"serverName" = Attributes.serverName,
		"isHost" = Attributes.isHost,
		"currentRest" = Attributes.currentRest,
		
		# collectables
		
		"numCollected" = Attributes.numCollected,
		"angry_pete" = Attributes.angry_pete,
		"basketball" = Attributes.basketball,
		"bell_tower" = Attributes.bell_tower,
		"boilermaker_train" = Attributes.boilermaker_train,
		"go_boilers" = Attributes.go_boilers,
		"iu_poster" = Attributes.iu_poster,
		"purdue_cap" = Attributes.purdue_cap,
		"purdue_helmet" = Attributes.purdue_helmet,
		"purdue_symbol" = Attributes.purdue_symbol,
		"dorm_display" = Attributes.dorm_display,
		"display_item_number" = Attributes.display_item_number,
		"display_item_1" = Attributes.display_item_1,
		"display_item_2" = Attributes.display_item_2,
		"display_item_3" = Attributes.display_item_3,
		
		"bed" = Attributes.curr_bed,
		"desk" = Attributes.curr_desk,
		"sidetable" = Attributes.curr_sidetable,
		"window" = Attributes.curr_window,
		"hair" = Attributes.curr_hair,
		"body" = Attributes.curr_body,
		"eyes" = Attributes.curr_eyes,
		"outfit" = Attributes.curr_outfit,
		"season" = Attributes.season,
		"isNight" = Attributes.night,
		"engineeringVisited" = Attributes.engineering_ftn_visited,
		"loebVisited"= Attributes.loeb_ftn_visited,
		"quest1active" = Attributes.quest1_active,
		"quest1complete" = Attributes.quest1_completed,
		"quest2active" = Attributes.quest2_active,
		"quest2complete" = Attributes.quest2_completed,
		"quest3active" = Attributes.quest3_active,
		"quest3complete" = Attributes.quest3_completed,
		"basics_shown" = Attributes.basics_shown,
		"course1_name" = Attributes.courseNames["course1_name"],
		"course2_name" = Attributes.courseNames["course2_name"],
		"course3_name" = Attributes.courseNames["course3_name"],
		"course4_name" = Attributes.courseNames["course4_name"],
		"course5_name" = Attributes.courseNames["course5_name"],
		"course6_name" = Attributes.courseNames["course6_name"],
		"course7_name" = Attributes.courseNames["course7_name"],
		"course8_name" = Attributes.courseNames["course8_name"],
		"course1_time" = Attributes.courseTimes["course1_time"],
		"course2_time" = Attributes.courseTimes["course2_time"],
		"course3_time" = Attributes.courseTimes["course3_time"],
		"course4_time" = Attributes.courseTimes["course4_time"],
		"course5_time" = Attributes.courseTimes["course5_time"],
		"course6_time" = Attributes.courseTimes["course6_time"],
		"course7_time" = Attributes.courseTimes["course7_time"],
		"course8_time" = Attributes.courseTimes["course8_time"],
		"course1_days" = 16*Attributes.courseDays["course1_days"]["M"] + 8*Attributes.courseDays["course1_days"]["T"] + 4*Attributes.courseDays["course1_days"]["W"] + 2*Attributes.courseDays["course1_days"]["R"] +  Attributes.courseDays["course1_days"]["F"],
		"course2_days" = 16*Attributes.courseDays["course2_days"]["M"] + 8*Attributes.courseDays["course2_days"]["T"] + 4*Attributes.courseDays["course2_days"]["W"] + 2*Attributes.courseDays["course2_days"]["R"] +  Attributes.courseDays["course2_days"]["F"],
		"course3_days" = 16*Attributes.courseDays["course3_days"]["M"] + 8*Attributes.courseDays["course3_days"]["T"] + 4*Attributes.courseDays["course3_days"]["W"] + 2*Attributes.courseDays["course3_days"]["R"] +  Attributes.courseDays["course3_days"]["F"],
		"course4_days" = 16*Attributes.courseDays["course4_days"]["M"] + 8*Attributes.courseDays["course4_days"]["T"] + 4*Attributes.courseDays["course4_days"]["W"] + 2*Attributes.courseDays["course4_days"]["R"] +  Attributes.courseDays["course4_days"]["F"],
		"course5_days" = 16*Attributes.courseDays["course5_days"]["M"] + 8*Attributes.courseDays["course5_days"]["T"] + 4*Attributes.courseDays["course5_days"]["W"] + 2*Attributes.courseDays["course5_days"]["R"] +  Attributes.courseDays["course5_days"]["F"],
		"course6_days" = 16*Attributes.courseDays["course6_days"]["M"] + 8*Attributes.courseDays["course6_days"]["T"] + 4*Attributes.courseDays["course6_days"]["W"] + 2*Attributes.courseDays["course6_days"]["R"] +  Attributes.courseDays["course6_days"]["F"],
		"course7_days" = 16*Attributes.courseDays["course7_days"]["M"] + 8*Attributes.courseDays["course7_days"]["T"] + 4*Attributes.courseDays["course7_days"]["W"] + 2*Attributes.courseDays["course7_days"]["R"] +  Attributes.courseDays["course7_days"]["F"],
		"course8_days" = 16*Attributes.courseDays["course8_days"]["M"] + 8*Attributes.courseDays["course8_days"]["T"] + 4*Attributes.courseDays["course8_days"]["W"] + 2*Attributes.courseDays["course8_days"]["R"] +  Attributes.courseDays["course8_days"]["F"],
		"course1_location" = Attributes.courseLocations["course1_location"],
		"course2_location" = Attributes.courseLocations["course2_location"],
		"course3_location" = Attributes.courseLocations["course3_location"],
		"course4_location" = Attributes.courseLocations["course4_location"],
		"course5_location" = Attributes.courseLocations["course5_location"],
		"course6_location" = Attributes.courseLocations["course6_location"],
		"course7_location" = Attributes.courseLocations["course7_location"],
		"course8_location" = Attributes.courseLocations["course8_location"],
		"coursenum" = Attributes.course_num,
		# Daily Question
		"question_available" = Attributes.question_available,
		"last_daily_question_time" = "" if (Attributes.last_daily_question_time.is_empty()) else Time.get_datetime_string_from_datetime_dict(Attributes.last_daily_question_time, false),
		
		# Time and Day/Night Cycle
		"time" = Attributes.time,
		"day_night_enabled" = Attributes.day_night_enabled,
		"interest_1" = Attributes.interest_1,
		"interest_2" = Attributes.interest_2,
		"interest_3" = Attributes.interest_3,
		"day_night_ui_toggle" = Attributes.day_night_ui_toggle,
		"ui_toggle_1" = Attributes.ui_toggle_1,
		"ui_toggle_2" = Attributes.ui_toggle_2,
		"minimap_toggle" = Attributes.minimap_toggle,
		"trade_req" = Attributes.trade_req,
		"trade_sender" = Attributes.trade_sender,
		"trade_receiver" = Attributes.trade_receiver
	})

func load():
	var player : Array = (Attributes.database).select_rows("Players", "username == '%s'" % Attributes.username, ["*"])
	
	Attributes.xp = player[0].xp
	Attributes.username = player[0].username
	Attributes.xhousing = player[0].xhousing
	Attributes.yhousing = player[0].yhousing
	Attributes.xacademic = player[0].xacademic
	Attributes.yacademic = player[0].yacademic
	Attributes.location = player[0].location
	Attributes.rank = player[0].rank
	Attributes.serverName = player[0].serverName
	Attributes.isHost = player[0].isHost
	Attributes.currentRest = player[0].currentRest

	# collectables

	Attributes.numCollected = player[0].numCollected
	Attributes.angry_pete = player[0].angry_pete
	if (Attributes.angry_pete):
		Attributes.items.append(ItemManager.Items.ANGRY_PETE)
	Attributes.basketball = player[0].basketball
	if (Attributes.basketball):
		Attributes.items.append(ItemManager.Items.BASKETBALL)
	Attributes.bell_tower = player[0].bell_tower
	if (Attributes.bell_tower):
		Attributes.items.append(ItemManager.Items.BELL_TOWER)
	Attributes.boilermaker_train = player[0].boilermaker_train
	if (Attributes.boilermaker_train):
		Attributes.items.append(ItemManager.Items.BOILERMAKER_TRAIN)
	Attributes.go_boilers = player[0].go_boilers
	if (Attributes.go_boilers):
		Attributes.items.append(ItemManager.Items.GO_BOILERS)
	Attributes.iu_poster = player[0].iu_poster
	if (Attributes.iu_poster):
		Attributes.items.append(ItemManager.Items.IU_SUCKS_POSTER)
	Attributes.purdue_cap = player[0].purdue_cap
	if (Attributes.purdue_cap):
		Attributes.items.append(ItemManager.Items.PURDUE_CAP)
	Attributes.purdue_helmet = player[0].purdue_helmet
	if (Attributes.purdue_helmet):
		Attributes.items.append(ItemManager.Items.PURDUE_HELMET)
	Attributes.purdue_symbol = player[0].purdue_symbol
	if (Attributes.purdue_symbol):
		Attributes.items.append(ItemManager.Items.PURDUE_SYMBOL)
	Attributes.dorm_display = player[0].dorm_display
	Attributes.display_item_number = player[0].display_item_number
	Attributes.display_item_1 = player[0].display_item_1
	Attributes.display_item_2 = player[0].display_item_2
	Attributes.display_item_3 = player[0].display_item_3

	Attributes.curr_bed = player[0].bed
	Attributes.curr_desk = player[0].desk
	Attributes.curr_window = player[0].window
	Attributes.curr_sidetable = player[0].sidetable
	Attributes.curr_hair = player[0].hair
	Attributes.curr_body = player[0].body
	Attributes.curr_eyes = player[0].eyes
	Attributes.curr_outfit = player[0].outfit
	Attributes.season = player[0].season
	Attributes.night = player[0].isNight
	Attributes.engineering_ftn_visited = player[0].engineeringVisited
	Attributes.loeb_ftn_visited = player[0].loebVisited
	Attributes.quest1_active = player[0].quest1active
	Attributes.quest1_completed = player[0].quest1complete
	Attributes.quest2_active = player[0].quest2active
	Attributes.quest2_completed = player[0].quest2complete
	Attributes.quest3_active = player[0].quest3active
	Attributes.quest3_completed = player[0].quest3complete
	Attributes.basics_shown = player[0].basics_shown
	Attributes.courseNames = { "course1_name" : player[0].course1_name,
							   "course2_name" : player[0].course2_name,
							   "course3_name" : player[0].course3_name,
							   "course4_name" : player[0].course4_name,
							   "course5_name" : player[0].course5_name,
							   "course6_name" : player[0].course6_name,
							   "course7_name" : player[0].course7_name,
							   "course8_name" : player[0].course8_name }
	Attributes.courseTimes = { "course1_time" : player[0].course1_time,
							   "course2_time" : player[0].course2_time,
							   "course3_time" : player[0].course3_time,
							   "course4_time" : player[0].course4_time,
							   "course5_time" : player[0].course5_time,
							   "course6_time" : player[0].course6_time,
							   "course7_time" : player[0].course7_time,
							   "course8_time" : player[0].course8_time }
	Attributes.courseDays = { "course1_days" : { "M" : 1 if ((player[0].course1_days & 16) > 0) else 0,
												 "T" : 1 if ((player[0].course1_days & 8) > 0) else 0,
												 "W" : 1 if ((player[0].course1_days & 4) > 0) else 0,
												 "R" : 1 if ((player[0].course1_days & 2) > 0) else 0,
												 "F" : 1 if ((player[0].course1_days & 1) > 0) else 0 },
							  "course2_days" : { "M" : 1 if ((player[0].course2_days & 16) > 0) else 0,
												 "T" : 1 if ((player[0].course2_days & 8) > 0) else 0,
												 "W" : 1 if ((player[0].course2_days & 4) > 0) else 0,
												 "R" : 1 if ((player[0].course2_days & 2) > 0) else 0,
												 "F" : 1 if ((player[0].course2_days & 1) > 0) else 0 },
							  "course3_days" : { "M" : 1 if ((player[0].course3_days & 16) > 0) else 0,
												 "T" : 1 if ((player[0].course3_days & 8) > 0) else 0,
												 "W" : 1 if ((player[0].course3_days & 4) > 0) else 0,
												 "R" : 1 if ((player[0].course3_days & 2) > 0) else 0,
												 "F" : 1 if ((player[0].course3_days & 1) > 0) else 0 },
							  "course4_days" : { "M" : 1 if ((player[0].course4_days & 16) > 0) else 0,
												 "T" : 1 if ((player[0].course4_days & 8) > 0) else 0,
												 "W" : 1 if ((player[0].course4_days & 4) > 0) else 0,
												 "R" : 1 if ((player[0].course4_days & 2) > 0) else 0,
												 "F" : 1 if ((player[0].course4_days & 1) > 0) else 0 },
							  "course5_days" : { "M" : 1 if ((player[0].course5_days & 16) > 0) else 0,
												 "T" : 1 if ((player[0].course5_days & 8) > 0) else 0,
												 "W" : 1 if ((player[0].course5_days & 4) > 0) else 0,
												 "R" : 1 if ((player[0].course5_days & 2) > 0) else 0,
												 "F" : 1 if ((player[0].course5_days & 1) > 0) else 0 },
							  "course6_days" : { "M" : 1 if ((player[0].course6_days & 16) > 0) else 0,
												 "T" : 1 if ((player[0].course6_days & 8) > 0) else 0,
												 "W" : 1 if ((player[0].course6_days & 4) > 0) else 0,
												 "R" : 1 if ((player[0].course6_days & 2) > 0) else 0,
												 "F" : 1 if ((player[0].course6_days & 1) > 0) else 0 },
							  "course7_days" : { "M" : 1 if ((player[0].course7_days & 16) > 0) else 0,
												 "T" : 1 if ((player[0].course7_days & 8) > 0) else 0,
												 "W" : 1 if ((player[0].course7_days & 4) > 0) else 0,
												 "R" : 1 if ((player[0].course7_days & 2) > 0) else 0,
												 "F" : 1 if ((player[0].course7_days & 1) > 0) else 0 },
							  "course8_days" : { "M" : 1 if ((player[0].course8_days & 16) > 0) else 0,
												 "T" : 1 if ((player[0].course8_days & 8) > 0) else 0,
												 "W" : 1 if ((player[0].course8_days & 4) > 0) else 0,
												 "R" : 1 if ((player[0].course8_days & 2) > 0) else 0,
												 "F" : 1 if ((player[0].course8_days & 1) > 0) else 0 } }
	Attributes.courseLocations = { "course1_location" : player[0].course1_location,
								   "course2_location" : player[0].course2_location,
								   "course3_location" : player[0].course3_location,
								   "course4_location" : player[0].course4_location,
								   "course5_location" : player[0].course5_location,
								   "course6_location" : player[0].course6_location,
								   "course7_location" : player[0].course7_location,
								   "course8_location" : player[0].course8_location }
	Attributes.course_num = player[0].coursenum 
	# Daily Question
	Attributes.question_available = player[0].question_available
	Attributes.last_daily_question_time = {} if (player[0].last_daily_question_time.is_empty()) else Time.get_datetime_dict_from_datetime_string(player[0].last_daily_question_time, true)
	# Time and Day/Night
	Attributes.time = player[0].time
	Attributes.day_night_enabled = player[0].day_night_enabled
	Attributes.interest_1 = player[0].interest_1
	Attributes.interest_2 = player[0].interest_2
	Attributes.interest_3 = player[0].interest_3
	Attributes.day_night_ui_toggle = player[0].day_night_ui_toggle
	Attributes.ui_toggle_1 = player[0].ui_toggle_1
	Attributes.ui_toggle_2 = player[0].ui_toggle_2
	Attributes.minimap_toggle = player[0].minimap_toggle
	Attributes.trade_req = player[0].trade_req
	Attributes.trade_sender = player[0].trade_sender
	Attributes.trade_receiver = player[0].trade_receiver
func delete():
	(Attributes.database).delete_rows("Players", "username == '%s'" % Attributes.username)
