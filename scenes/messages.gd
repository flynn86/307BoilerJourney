extends Node2D

func _on_back_to_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

func _on_dm_button_pressed():
	if ($DMUser.text == ""):
		$Label5.text = "Please Enter the Username of the Player you Would Like to Start a Direct Message Chat with"
	else:
		if ($DMUser.text < Attributes.username):
			Attributes.dm_temp = "%s_%s_Chat" % [$DMUser.text, Attributes.username];
		else:
			Attributes.dm_temp = "%s_%s_Chat" % [Attributes.username, $DMUser.text];
		var table = {
			"username" : {"data_type":"text"},
			"message" : {"data_type":"text"},
			"time" : {"data_type":"text"},
			"date" : {"data_type":"text"}
		}
		(Attributes.database).create_table(Attributes.dm_temp, table)
		get_tree().change_scene_to_file("res://scenes/direct_message.tscn")

func _on_gc_button_pressed():
	if not ($GCUsers.text.contains(",")):
		$Label5.text = "Please Enter the Usernames of the Players you Would Like to Start a Group Chat with"
	else:
		var arr : Array = ("%s,%s" % [$GCUsers.text, Attributes.username]).split(",")
		arr.sort()
		Attributes.gc_temp = "";
		for i in arr:
			Attributes.gc_temp += "%s_" % i
		Attributes.gc_temp += "Chat"
		var table = {
			"username" : {"data_type":"text"},
			"message" : {"data_type":"text"},
			"time" : {"data_type":"text"},
			"date" : {"data_type":"text"}
		}
		(Attributes.database).create_table(Attributes.gc_temp, table)
		get_tree().change_scene_to_file("res://scenes/group_chat.tscn")
