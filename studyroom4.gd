extends Node2D

var start = true

func _ready():
	var data : Array = (Attributes.database).select_rows("%s_Chat" % Attributes.group4, "username != 'null'", ["*"])
	var data_line : String = ""
	for i in data.size():
		data_line += "From " + data[i].username + " at " + data[i].time + " on " + data[i].date + ": " + data[i].message + '\n'
	$Label.text = data_line
	
func _process(_delta):
	_ready()

func _on_send_message_pressed():
	var timedate : Dictionary = Time.get_datetime_dict_from_system()
	var data = {
		"username" = Attributes.username,
		"message" = $LineEdit.text,
		"date" = str(timedate.month) + "-" + str(timedate.day) + "-" + str(timedate.year),
		"time" = "%02d:%02d:%02d" % [timedate.hour, timedate.minute, timedate.second]
	}
	(Attributes.database).insert_row("%s_Chat" % Attributes.group4, data)
	#_ready()

func _on_back_to_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/study_rooms.tscn")


func _on_clear_button_pressed():
	var table = {
		"username" : {"data_type":"text"},
		"message" : {"data_type":"text"},
		"time" : {"data_type":"text"},
		"date" : {"data_type":"text"}
	}
	(Attributes.database).create_table("%s_Chat" % Attributes.group4, table)
	(Attributes.database).drop_table("%s_Chat" % Attributes.group4)
	(Attributes.database).create_table("%s_Chat" % Attributes.group4, table)
