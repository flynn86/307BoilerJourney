extends Node2D

@onready var username_entry = $Panel/LineEdit

func _ready():
	Attributes.database = SQLite.new()
	(Attributes.database).path = "res://data.db"
	(Attributes.database).open_db()
	#(Attributes.database).SetMaxOpenConns(1)
	var table = {
		"xp" : {"data_type":"int"},
		"username" : {"data_type":"text"},
		"xhousing" : {"data_type":"real"},
		"yhousing" : {"data_type":"real"},
		"xacademic" : {"data_type":"real"},
		"yacademic" : {"data_type":"real"},
		"location" : {"data_type":"text"},
		"rank" : {"data_type":"text"},
		"serverName" : {"data_type":"text"},
		"isHost" : {"data_type":"bool"},
		"currentRest" : {"data_type":"text"},
		
		# collectables
		
		"numCollected" : {"data_type":"int"},
		"angry_pete" : {"data_type":"bool"},
		"basketball" : {"data_type":"bool"},
		"bell_tower" : {"data_type":"bool"},
		"boilermaker_train" : {"data_type":"bool"},
		"go_boilers" : {"data_type":"bool"},
		"iu_poster" : {"data_type":"bool"},
		"purdue_cap" : {"data_type":"bool"},
		"purdue_helmet" : {"data_type":"bool"},
		"purdue_symbol" : {"data_type":"bool"},
		"dorm_display" : {"data_type":"bool"},
		"display_item_number" : {"data_type":"int"},
		"display_item_1" : {"data_type":"int"},
		"display_item_2" : {"data_type":"int"},
		"display_item_3" : {"data_type":"int"},
	
		"bed" : {"data_type":"int"},
		"desk" : {"data_type":"int"},
		"sidetable" : {"data_type":"int"},
		"window" : {"data_type":"int"},
		"hair" : {"data_type":"int"},
		"body" : {"data_type":"int"},
		"eyes" : {"data_type":"int"},
		"outfit" : {"data_type":"int"},
		"season" : {"data_type":"text"},
		"isNight" : {"data_type":"bool"},
		"engineeringVisited" : {"data_type":"bool"},
		"loebVisited": {"data_type":"bool"},
		"quest1active" : {"data_type":"bool"},
		"quest1complete" : {"data_type":"bool"},
		"quest2active" : {"data_type":"bool"},
		"quest2complete" : {"data_type":"bool"},
		"quest3active" : {"data_type":"bool"},
		"quest3complete" : {"data_type":"bool"},
		"basics_shown" : {"data_type":"bool"},
		"course1_name" : {"data_type":"text"},
		"course2_name" : {"data_type":"text"},
		"course3_name" : {"data_type":"text"},
		"course4_name" : {"data_type":"text"},
		"course5_name" : {"data_type":"text"},
		"course6_name" : {"data_type":"text"},
		"course7_name" : {"data_type":"text"},
		"course8_name" : {"data_type":"text"},
		"course1_time" : {"data_type":"int"},
		"course2_time" : {"data_type":"int"},
		"course3_time" : {"data_type":"int"},
		"course4_time" : {"data_type":"int"},
		"course5_time" : {"data_type":"int"},
		"course6_time" : {"data_type":"int"},
		"course7_time" : {"data_type":"int"},
		"course8_time" : {"data_type":"int"},
		"course1_days" : {"data_type":"int"},
		"course2_days" : {"data_type":"int"},
		"course3_days" : {"data_type":"int"},
		"course4_days" : {"data_type":"int"},
		"course5_days" : {"data_type":"int"},
		"course6_days" : {"data_type":"int"},
		"course7_days" : {"data_type":"int"},
		"course8_days" : {"data_type":"int"},
		"course1_location" : {"data_type":"text"},
		"course2_location" : {"data_type":"text"},
		"course3_location" : {"data_type":"text"},
		"course4_location" : {"data_type":"text"},
		"course5_location" : {"data_type":"text"},
		"course6_location" : {"data_type":"text"},
		"course7_location" : {"data_type":"text"},
		"course8_location" : {"data_type":"text"},
		"coursenum": {"data_type":"int"},
		# Daily Question
		"question_available" : {"data_type":"bool"},
		"last_daily_question_time" : {"data_type":"String"},
		# Time and Day/Night Cycle
		"time" : {"data_type":"real"},
		"day_night_enabled" : {"data_type":"bool"},
		"interest_1" : {"data_type":"text"},
		"interest_2" : {"data_type":"text"},
		"interest_3" : {"data_type":"text"},
		"day_night_ui_toggle" : {"data_type":"bool"},
		"ui_toggle_1" : {"data_type":"bool"},
		"ui_toggle_2" : {"data_type":"bool"},
		"minimap_toggle" : {"data_type":"bool"}
	}
	(Attributes.database).create_table("Players", table)
	var friend_reqs = {
		"sender" : {"data_type":"text"},
		"recipient" : {"data_type":"text"}
	}
	(Attributes.database).create_table("Friend_Reqs", friend_reqs)
	var friend_list = {
		"friend1" : {"data_type":"text"},
		"friend2" : {"data_type":"text"}
	}
	(Attributes.database).create_table("Friend_List", friend_list)

func _on_start_new_game_pressed():
	if username_entry.text == "":
		$Panel/Label.text = "You must enter a username before starting a game."
		$Panel/Label.visible = true
	else:
		Attributes.username = username_entry.text
		if ((Attributes.database).select_rows("Players", "username = '" + Attributes.username + "'", ["*"])):
			$Panel/Label.text = "Username taken."
			$Panel/Label.visible = true
		else:
			Attributes.reset(Attributes.username)
			SaveUtils.initialize()
			get_tree().change_scene_to_file("res://characters/character_built.tscn")

func _on_load_game_pressed():
	if username_entry.text == "":
		$Panel/Label.text = "You must enter the username of the game you want to load."
		$Panel/Label.visible = true
	else:
		Attributes.username = username_entry.text
		if (!(Attributes.database).select_rows("Players", "username = '" + Attributes.username + "'", ["*"])):
			$Panel/Label.text = "Username does not exist."
			$Panel/Label.visible = true
		else:
			SaveUtils.load()
			get_tree().change_scene_to_file(Attributes.location)

func _on_delete_game_pressed():
	if username_entry.text == "":
		$Panel/Label.text = "You must enter the username of the game you want to delete."
		$Panel/Label.visible = true
	else:
		Attributes.username = username_entry.text
		if (!(Attributes.database).select_rows("Players", "username = '" + Attributes.username + "'", ["*"])):
			$Panel/Label.text = "Username does not exist."
			$Panel/Label.visible = true
		else:
			SaveUtils.delete()
			$Panel/Label.text = "Game Successfully Deleted."
			$Panel/Label.visible = true
