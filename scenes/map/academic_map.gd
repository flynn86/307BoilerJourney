extends Node2D

var frame_counter = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$CharacterBody2D.global_position = Vector2(float(Attributes.xacademic),float(Attributes.yacademic))
	get_node("SummerVariantA").visible = false
	get_node("FallVariantA").visible = false
	get_node("SpringVariantA").visible = false
	get_node("WinterVariantA").visible = false
	get_node("CharacterBody2D/Panel2").visible = false
	$CharacterBody2D/Panel.visible = false
	get_node("CharacterBody2D/transportation_panel").visible = false
	if (Attributes.season == "Summer"):
		get_node("SummerVariantA").visible = true
	elif (Attributes.season == "Fall"):
		get_node("FallVariantA").visible = true
	elif (Attributes.season == "Spring"):
		get_node("SummerVariantA").visible = true
		get_node("SpringVariantA").visible = true
	elif (Attributes.season == "Winter"):
		get_node("WinterVariantA").visible = true
	if (Attributes.night):
		get_node("CharacterBody2D/Player/player_light").visible = true
	var building_list = ["ARMS", "PUSH", "HAMP", "PHYS", "RNPH", "JNSN", "FRNY", "DSCB", "MSEE", "CHAS", "BHEE", "AR", "ELLT", 
 					"HOVD", "ME", "WALC", "POTR", "LMBS", "KNOY", "DUDL", "HAAS", "PSYC", "PRCE", "CL50", "MATH", "SC", 
 					"WTHR", "BRWN", "HEAV", "GRIS", "BRNG", "SCHM", "UNIV", "MTHW", "STON", "STEW", "HIKS", "PMU"]
	for building in building_list:
		_schedule_for_each_building(building)
	set_process_input(true)
	get_node("Purdue_symbol").visible = !Attributes.purdue_symbol
	get_node("IU_Sucks_Poster").visible = !Attributes.iu_poster
	get_node("bell_tower").visible = !Attributes.bell_tower
	get_node("go_boilers").visible = !Attributes.go_boilers
	get_node("angry_pete").visible = !Attributes.angry_pete
	
	$CharacterBody2D/Panel.visible = false
	get_node("Inventory_container").visible = false
	get_node("Trivia_container").visible = false
	get_node("day_night").visible = false
	get_node("CharacterBody2D/Player/location_text")
	get_node("CharacterBody2D/Player/GameBasics").visible = !Attributes.basics_shown
	get_node("CharacterBody2D/Player/view_suggestions").visible = false
	$CharacterBody2D/Player/OnlinePlayersTrade.visible = false
	$CharacterBody2D/Player/OnlinePlayerList.visible = false
	$CharacterBody2D/Player/Trade_Request_Notif.visible = false

func _input(event):
	if event is InputEventMouseMotion or event is InputEventMouseButton:
		var mouse_pos = event.position

func _on_Area2D_input_event(viewport, event, shape_idx, build_name: String):
	if event is InputEventScreenTouch and event.pressed:
		Attributes.xacademic = $CharacterBody2D.global_position.x
		Attributes.yacademic = $CharacterBody2D.global_position.y
		open_tab(build_name)
	elif event is InputEventMouseButton and event.pressed:
		Attributes.xacademic = $CharacterBody2D.global_position.x
		Attributes.yacademic = $CharacterBody2D.global_position.y
		open_tab(build_name)

func open_tab(building_name: String):
	Attributes.xacademic = $CharacterBody2D.global_position.x
	Attributes.yacademic = $CharacterBody2D.global_position.y
	if building_name == "PMU":
		get_tree().change_scene_to_file("res://scenes/PMU_scene/pmu_scene.tscn")
	else: 
		var file = FileAccess.open("res://location_information/building_name.txt", FileAccess.WRITE)
		file.store_string(building_name)
		get_tree().change_scene_to_file("res://scenes/location_tab/location_page.tscn")

func _on_panel_closed():
	Attributes.xacademic = $CharacterBody2D.global_position.x
	Attributes.yacademic = $CharacterBody2D.global_position.y
	SaveUtils.save()
	self.visible = true

func _on_housing_button_pressed():
	Attributes.xacademic = $CharacterBody2D.global_position.x
	Attributes.yacademic = $CharacterBody2D.global_position.y
	Attributes.location = "res://scenes/map/housing_map.tscn"
	get_tree().change_scene_to_file("res://scenes/map/housing_map.tscn")
	SaveUtils.save()

func _on_change_summer_pressed():
	Attributes.season = "Summer"
	get_node("SummerVariantA").visible = true
	get_node("FallVariantA").visible = false
	get_node("SpringVariantA").visible = false
	get_node("WinterVariantA").visible = false

func _on_change_winter_pressed():
	Attributes.season = "Winter"
	get_node("SummerVariantA").visible = false
	get_node("FallVariantA").visible = false
	get_node("SpringVariantA").visible = false
	get_node("WinterVariantA").visible = true

func _on_change_fall_pressed():
	Attributes.season = "Fall"
	get_node("SummerVariantA").visible = false
	get_node("FallVariantA").visible = true
	get_node("SpringVariantA").visible = false
	get_node("WinterVariantA").visible = false


func _on_change_spring_pressed():
	Attributes.season = "Spring"
	get_node("SummerVariantA").visible = true
	get_node("FallVariantA").visible = false
	get_node("SpringVariantA").visible = true
	get_node("WinterVariantA").visible = false

func _on_day_night_button_pressed():
	Attributes.day_night_enabled = ! Attributes.day_night_enabled

func _on_menu_button_pressed():
	Attributes.xacademic = $CharacterBody2D.global_position.x
	Attributes.yacademic = $CharacterBody2D.global_position.y
	Attributes.location = "res://scenes/map/academic_map.tscn"
	SaveUtils.save()
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_questlog_button_pressed():
	Attributes.xacademic = $CharacterBody2D.global_position.x
	Attributes.yacademic = $CharacterBody2D.global_position.y
	Attributes.location = "res://scenes/map/academic_map.tscn"
	SaveUtils.save()
	get_tree().change_scene_to_file("res://scenes/quests/quest_log.tscn")


func _on_engineering_fountain_body_entered(body):
	if (body.name == "CharacterBody2D"):
		Attributes.engineering_ftn_visited = true


func _on_loeb_fountain_body_entered(body):
	if (body.name == "CharacterBody2D"):
		Attributes.loeb_ftn_visited = true

func _on_bell_tower_body_entered(body):
	if (body.name == "CharacterBody2D"):
		$RingBellTower.visible = true

func _on_bell_tower_body_exited(body):
	if (body.name == "CharacterBody2D"):
		$RingBellTower.visible = false

func _on_ring_bell_tower_pressed():
	if Attributes.quest2_active:
		Attributes.quest2_active = false
		Attributes.quest2_completed = true
		Attributes.xp = Attributes.xp + 5
		(Attributes.database).update_rows("Players", "username = '" + Attributes.username + "'", {"xp": Attributes.xp})
	$BellTowerSound.play()

func _process(delta):
	if (Attributes.quest1_active):
		if (Attributes.engineering_ftn_visited == true and Attributes.loeb_ftn_visited == true):
			Attributes.quest1_completed = true
			Attributes.quest1_active = false
			Attributes.xp = Attributes.xp + 10
			(Attributes.database).update_rows("Players", "username = '" + Attributes.username + "'", {"xp": Attributes.xp})
	if (Attributes.quest3_active):
		if (Attributes.numCollected >= 3):
			Attributes.quest3_completed = true
			Attributes.quest3_active = false
			Attributes.xp = Attributes.xp + 15
			(Attributes.database).update_rows("Players", "username = '" + Attributes.username + "'", {"xp": Attributes.xp})
	if Attributes.xp <= 29:
		Attributes.rank = "Freshman"
	elif Attributes.xp <= 59: 
		if (Attributes.rank != "Sophomore"):
			get_node("CharacterBody2D/Panel2").visible = true
		Attributes.rank = "Sophomore"
	elif Attributes.xp <= 89:
		if (Attributes.rank != "Junior"):
			get_node("CharacterBody2D/Panel2").visible = true
		Attributes.rank = "Junior"
	else: 
		if (Attributes.rank != "Senior"):
			get_node("CharacterBody2D/Panel2").visible = true
		Attributes.rank = "Senior"
	frame_counter += 1
	
	if (frame_counter > 20):
		# Checks for trade requests sent to this user
		if (Attributes.trade_req == false):
			(Attributes.database).query("SELECT sender FROM Trade_Requests WHERE receiver = '" + Attributes.username + "'" + " AND status = 0")
			if ((Attributes.database).query_result):
				var sender = (Attributes.database).query_result[0]["sender"]
				$CharacterBody2D/Player/Trade_Request_Notif.send_trade_request(sender)
		# Checks for trade accepts sent by this user
		(Attributes.database).query("SELECT * FROM Trade_Requests WHERE sender = '" + Attributes.username + "'" + " AND status = 1")
		if ((Attributes.database).query_result):
			var receiver = (Attributes.database).query_result[0]["receiver"]
			Attributes.trade_sender = Attributes.username
			Attributes.trade_receiver = receiver
			Attributes.location = "res://scenes/map/academic_map.tscn"
			get_tree().change_scene_to_file("res://scenes/trading/trading.tscn")
		frame_counter = 0

func _on_view_schedule_pressed():
	Attributes.xacademic = $CharacterBody2D.global_position.x
	Attributes.yacademic = $CharacterBody2D.global_position.y
	Attributes.location = "res://scenes/map/academic_map.tscn"
	SaveUtils.save()
	get_tree().change_scene_to_file("res://scenes/schedule.tscn")
	

func _on_inventory_pressed():
	Attributes.xacademic = $CharacterBody2D.global_position.x
	Attributes.yacademic = $CharacterBody2D.global_position.y
	Attributes.location = "res://scenes/map/academic_map.tscn"
	SaveUtils.save()
	get_tree().change_scene_to_file("res://scenes/Inventory/player_inventory.tscn")

func _on_daily_trivia_pressed():
	Attributes.xacademic = $CharacterBody2D.global_position.x
	Attributes.yacademic = $CharacterBody2D.global_position.y
	Attributes.location = "res://scenes/map/academic_map.tscn"
	SaveUtils.save()
	get_tree().change_scene_to_file("res://scenes/daily_trivia/daily_trivia.tscn")

func _on_button_pressed():
	$CharacterBody2D/Panel.visible = false

func _on_variants_pressed():
	$CharacterBody2D/Panel.visible = true

func _schedule_for_each_building(building):
	var complete_string = ""
	var count = 0
	if (Attributes.course_num == 1) :
		pass
	else:
		for i in range (1, Attributes.course_num):
			find_child(building).visible = false
			var location = "course" + str(i) + "_location"
			var courseLocation = Attributes.courseLocations[location]
			if courseLocation == building:
				count+=1
				var name = "course" + str(i) + "_name"
				var courseName = Attributes.courseNames[name]
				var time = "course" + str(i) + "_time"
				var courseTime = Attributes.courseTimes[time]
				var day = "course" + str(i) + "_days"
				var Days_dict = Attributes.courseDays[day]
				var courseDays = ""
				for j in Days_dict:
					if Days_dict[j] == 1:
						courseDays += j
				var format_string = "| Course Name: %s | Time: %s | Days: %s | Location: %s |\n"
				var actual_string = format_string % [courseName, courseTime, courseDays, courseLocation]
				complete_string += actual_string
	if count == 0:
		find_child(building).visible = false
	else:
		var count_string = "You have %s Courses in this building.\n" + complete_string
		var string_with_count = count_string % [count]
		find_child(building).text= string_with_count 

func _on_class_rank_pressed():
	Attributes.xacademic = $CharacterBody2D.global_position.x
	Attributes.yacademic = $CharacterBody2D.global_position.y
	Attributes.location = "res://scenes/map/academic_map.tscn"
	SaveUtils.save()
	get_tree().change_scene_to_file("res://scenes/rank_page/rank_page.tscn")

func _on_noti_close_pressed():
	get_node("CharacterBody2D/Panel2").visible = false

func _on_close_pressed():
	Attributes.basics_shown = true
	SaveUtils.save()
	get_node("CharacterBody2D/Player/GameBasics").visible = false
	

func _on_suggestions_pressed():
	get_node("CharacterBody2D/Player/view_suggestions").visible = true


func _on_close1_pressed():
	get_node("CharacterBody2D/Player/view_suggestions").visible = false




func _on_friends_list_pressed():
	Attributes.xacademic = $CharacterBody2D.global_position.x
	Attributes.yacademic = $CharacterBody2D.global_position.y
	Attributes.location = "res://scenes/map/academic_map.tscn"
	SaveUtils.save()
	get_tree().change_scene_to_file("res://scenes/friends_list/friends_list.tscn")


func _on_trade_pressed():
	#Attributes.xacademic = $CharacterBody2D.global_position.x
	#Attributes.yacademic = $CharacterBody2D.global_position.y
	#Attributes.location = "res://scenes/map/academic_map.tscn"
	#SaveUtils.save()
	$CharacterBody2D/Player/OnlinePlayersTrade.visible = ! $CharacterBody2D/Player/OnlinePlayersTrade.visible

func _on_time_button_pressed():
	if (Attributes.day_night_ui_toggle == true):
		time_animation(false)
		Attributes.day_night_ui_toggle = false;
		SaveUtils.save()
	else:
		time_animation(true)
		Attributes.day_night_ui_toggle = true;
		SaveUtils.save()
		
func time_animation(toggle : bool):
	if (toggle == true):
		get_node("CharacterBody2D/Player/Time Button").rotation_degrees = 0
		get_node("CharacterBody2D/Player/Time Button").position = Vector2(-900, 420)
		$CharacterBody2D/Player/DayNightCycleUI.position = Vector2(-1125, 372)
		for i in range(0,20,1):
			var x1 = $CharacterBody2D/Player/DayNightCycleUI.position.x
			$CharacterBody2D/Player/DayNightCycleUI.position = Vector2(x1 + 11.5, 372)
			var x2 = get_node("CharacterBody2D/Player/Time Button").position.x
			get_node("CharacterBody2D/Player/Time Button").position = Vector2(x2 + 11.5, 420)
			await get_tree().create_timer(0.01).timeout
		get_node("CharacterBody2D/Player/Time Button").rotation_degrees = 180
		get_node("CharacterBody2D/Player/Time Button").position = Vector2(-645, 460)
		$CharacterBody2D/Player/DayNightCycleUI.position = Vector2(-900, 372)
	else:
		get_node("CharacterBody2D/Player/Time Button").rotation_degrees = 180
		get_node("CharacterBody2D/Player/Time Button").position = Vector2(-645, 460)
		$CharacterBody2D/Player/DayNightCycleUI.position = Vector2(-900, 372)
		for i in range(0,20,1):
			var x1 = $CharacterBody2D/Player/DayNightCycleUI.position.x
			$CharacterBody2D/Player/DayNightCycleUI.position = Vector2(x1 - 11.5, 372)
			var x2 = get_node("CharacterBody2D/Player/Time Button").position.x
			get_node("CharacterBody2D/Player/Time Button").position = Vector2(x2 - 11.5, 460)
			await get_tree().create_timer(0.01).timeout
		get_node("CharacterBody2D/Player/Time Button").rotation_degrees = 0
		get_node("CharacterBody2D/Player/Time Button").position = Vector2(-900, 420)
		$CharacterBody2D/Player/DayNightCycleUI.position = Vector2(-1125, 372)


func _on_ui_toggle_1_pressed():
	if (Attributes.ui_toggle_1 == true):
		Attributes.ui_toggle_1 = false;
		SaveUtils.save()
		ui_toggle_1(false)
	else:
		Attributes.ui_toggle_1 = true;
		SaveUtils.save()
		ui_toggle_1(true)
		
func ui_toggle_1(toggle : bool):
	if (toggle == true):
		$CharacterBody2D/Player/UIToggle1.text = "Hide"
	else:
		$CharacterBody2D/Player/UIToggle1.text = "Show"
	$CharacterBody2D/Player/Button.visible = toggle
	$CharacterBody2D/Player/MenuButton.visible = toggle
	$CharacterBody2D/Player/variants.visible = toggle
	$CharacterBody2D/Player/ViewSchedule.visible = toggle
	$CharacterBody2D/Player/Inventory.visible = toggle
	$CharacterBody2D/Player/DayNight.visible = toggle
	get_node("CharacterBody2D/Player/class rank").visible = toggle


func _on_ui_toggle_2_pressed():
	if (Attributes.ui_toggle_2 == true):
		Attributes.ui_toggle_2 = false;
		SaveUtils.save()
		ui_toggle_2(false)
	else:
		Attributes.ui_toggle_2 = true;
		SaveUtils.save()
		ui_toggle_2(true)
		
func ui_toggle_2(toggle : bool):
	if (toggle == true):
		$CharacterBody2D/Player/UIToggle2.text = "Hide"
	else:
		$CharacterBody2D/Player/UIToggle2.text = "Show"
	$CharacterBody2D/Player/Trade.visible = toggle
	$CharacterBody2D/Player/FriendsList.visible = toggle
	$CharacterBody2D/Player/Suggestions.visible = toggle
	$CharacterBody2D/Player/DailyTrivia.visible = toggle
	$CharacterBody2D/Player/QuestLog.visible = toggle


func _on_minimap_toggle_pressed():
	if (Attributes.minimap_toggle == true):
		Attributes.minimap_toggle = false;
		SaveUtils.save()
		minimap_toggle(false)
	else:
		Attributes.minimap_toggle = true;
		SaveUtils.save()
		minimap_toggle(true)
		
func minimap_toggle(toggle : bool):
	if (toggle == true):
		$CharacterBody2D/Player/MinimapToggle.text = "Hide"
	else:
		$CharacterBody2D/Player/MinimapToggle.text = "Show"
	$CharacterBody2D/Player/SubViewportContainer.visible = toggle


func _on_tree_entered():
	var data = {
		"players" = Attributes.username
	}
	#(Attributes.database).query("SELECT COUNT(*) FROM Online_Players WHERE players = '" + Attributes.username + "'")
	#if ((Attributes.database).query_result.size() == 0):
	(Attributes.database).insert_row("Online_Players", data)


func _on_tree_exited():
	(Attributes.database).query("DELETE FROM Online_Players WHERE players = '" + Attributes.username + "'")

func _notification(notif): 
	if notif == NOTIFICATION_WM_CLOSE_REQUEST: 
		(Attributes.database).query("DELETE FROM Online_Players WHERE players = '" + Attributes.username + "'")

func _on_online_choice_pressed():
	$CharacterBody2D/Player/OnlinePlayerList.visible = true

func _on_close_trade_type_pressed():
	$CharacterBody2D/Player/OnlinePlayersTrade.visible = false

func _on_trans_close_pressed():
	get_node("CharacterBody2D/transportation_panel").visible = false

func _on_bus_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch and event.pressed:
		get_node("CharacterBody2D/transportation_panel").visible = true
	elif event is InputEventMouseButton and event.pressed:
		get_node("CharacterBody2D/transportation_panel").visible = true
