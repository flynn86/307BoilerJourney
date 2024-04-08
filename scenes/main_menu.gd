extends Node2D

@onready var username_entry = $LineEdit

func _ready():
	Attributes.database = SQLite.new()
	(Attributes.database).path = "res://data.db"
	(Attributes.database).open_db()
	var table = {
		"username" : {"data_type":"text"},
		"xhousing" : {"data_type":"float"},
		"yhousing" : {"data_type":"float"},
		"xacademic" : {"data_type":"float"},
		"yacademic" : {"data_type":"float"},
		"location" : {"data_type":"text"},
		"rank" : {"data_type":"text"},
		"serverName" : {"data_type":"text"},
		"isHost" : {"data_type":"bool"},
		
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
		"courseNames": {"data_type":"Dictionary"},
		"courseTimes": {"data_type":"Dictionary"},
		"courseDays": {"data_type":"Dictionary"},
		"courseLocations": {"data_type":"Dictionary"},
		"coursenum": {"data_type":"int"},
		# Inventory
		"items": {"data_type":"Array"},
		# Daily Question
		"question_available" : {"data_type":"bool"},
		"last_daily_question_time" : {"data_type":"Dictionary"},
		
		# Time and Day/Night Cycle
		"time" : {"data_type":"float"},
		"day_night_enabled" : {"data_type":"bool"}
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
		$Label.text = "You must enter a username before starting a game."
		$Label.visible = true
	else:
		Attributes.username = username_entry.text
		if ((Attributes.database).select_rows("Players", "username = '" + Attributes.username + "'", ["*"])):
			$Label.text = "Username taken."
			$Label.visible = true
		else:
			Attributes.reset(Attributes.username)
			get_tree().change_scene_to_file("res://characters/character_built.tscn")

func _on_load_game_pressed():
	if username_entry.text == "":
		$Label.text = "You must enter a username before starting a game."
		$Label.visible = true
	else:
		Attributes.username = username_entry.text
		if (!(Attributes.database).select_rows("Players", "username = '" + Attributes.username + "'", ["*"])):
			$Label.text = "Username does not exist."
			$Label.visible = true
		else:
			SaveUtils.load(Attributes.username)
			get_tree().change_scene_to_file(Attributes.location)

func _on_delete_game_pressed():
	if username_entry.text == "":
		$Label.text = "You must enter a username before starting a game."
		$Label.visible = true
	else:
		Attributes.username = username_entry.text
		if (!(Attributes.database).select_rows("Players", "username = '" + Attributes.username + "'", ["*"])):
			$Label.text = "Username does not exist."
			$Label.visible = true
		else:
			SaveUtils.delete(Attributes.username)
