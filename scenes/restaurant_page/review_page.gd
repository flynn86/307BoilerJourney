extends Panel

func _ready():
	var data : Array = (Attributes.database).select_rows("%s_Chat" % Attributes.serverName, "username != 'null'", ["*"])
	var data_line : String = ""
	for i in data.size():
		data_line += "From " + data[i].username + " at " + data[i].time + " on " + data[i].date + ": " + data[i].message + '\n'
	$Label.text = data_line
	$ClearButton.visible = Attributes.isHost
	
func _process(_delta):
	_ready()

func _leave_review_pressed():
	var timedate : Dictionary = Time.get_datetime_dict_from_system()
	var data = {
		"username" = Attributes.username,
		"message" = $LineEdit.text,
		"date" = str(timedate.month) + "-" + str(timedate.day) + "-" + str(timedate.year),
		"time" = "%02d:%02d:%02d" % [timedate.hour, timedate.minute, timedate.second]
	}
	(Attributes.database).insert_row("%s_Chat" % Attributes.serverName, data)

func _on_back_to_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/restaurant_page/restaurant_page.tscn")
