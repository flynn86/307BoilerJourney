extends Node2D

func _ready():
	get_node("LoadGame").visible = FileAccess.file_exists("res://savefiles/save1.bin")
	get_node("LoadGame2").visible = FileAccess.file_exists("res://savefiles/save2.bin")
	get_node("StartNewGame").visible = !FileAccess.file_exists("res://savefiles/save1.bin")
	get_node("StartNewGame2").visible = !FileAccess.file_exists("res://savefiles/save2.bin")
	get_node("DeleteGame").visible = FileAccess.file_exists("res://savefiles/save1.bin")
	get_node("DeleteGame2").visible = FileAccess.file_exists("res://savefiles/save2.bin")
	if FileAccess.file_exists("res://savefiles/save1.bin"):
		if FileAccess.open("res://savefiles/save1.bin", FileAccess.READ).get_length() == 0:
			get_node("LoadGame").visible = false
			get_node("StartNewGame").visible = true
			get_node("DeleteGame").visible = false
	if FileAccess.file_exists("res://savefiles/save2.bin"):
		if FileAccess.open("res://savefiles/save2.bin", FileAccess.READ).get_length() == 0:
			get_node("LoadGame2").visible = false
			get_node("StartNewGame2").visible = true
			get_node("DeleteGame2").visible = false
	
	Attributes.database = SQLite.new()
	(Attributes.database).path = "res://data.db"
	(Attributes.database).open_db()
	var table = {
		"username" : {"data_type":"text"},
		"xp" : {"data_type":"int"},
		"rank" : {"data_type":"text"},
		"serverName" : {"data_type":"text"},
		"isHost" : {"data_type":"bool"}
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
	Attributes.reset("res://savefiles/save1.bin")
	get_tree().change_scene_to_file("res://characters/character_built.tscn")

func _on_load_game_pressed():
	SaveUtils.load("res://savefiles/save1.bin")
	get_tree().change_scene_to_file(Attributes.location)

func _on_start_new_game_2_pressed():
	Attributes.reset("res://savefiles/save2.bin")
	get_tree().change_scene_to_file("res://characters/character_built.tscn")

func _on_load_game_2_pressed():
	SaveUtils.load("res://savefiles/save2.bin")
	get_tree().change_scene_to_file(Attributes.location)

func _on_delete_game_pressed():
	SaveUtils.delete("res://savefiles/save1.bin")
	get_node("LoadGame").visible = false
	get_node("StartNewGame").visible = true
	get_node("DeleteGame").visible = false

func _on_delete_game_2_pressed():
	SaveUtils.delete("res://savefiles/save2.bin")
	get_node("LoadGame2").visible = false
	get_node("StartNewGame2").visible = true
	get_node("DeleteGame2").visible = false
