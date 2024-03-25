extends Node2D


func _ready():
	var data : Array = (Attributes.database).select_rows("GlobalChat", "username != 'null'", ["*"])
	var data_line : String = ""
	for i in data.size():
		data_line += "From " + data[i].username + " at " + data[i].time + " on " + data[i].date + ": " + data[i].message + '\n'
	$Label.text = data_line

func _on_send_message_pressed():
	var timedate : Dictionary = Time.get_datetime_dict_from_system()
	var data = {
		"username" = Attributes.username,
		"message" = $LineEdit.text,
		"date" = str(timedate.month) + "-" + str(timedate.day) + "-" + str(timedate.year),
		"time" = str(timedate.hour) + ":" + str(timedate.minute) + ":" + str(timedate.second)
	}
	(Attributes.database).insert_row("GlobalChat", data)
	_ready()


func _on_back_to_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
