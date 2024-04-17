extends Node2D

@onready var textbox = $Panel/TextEdit

func _on_close_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

func _on_submit_pressed():
	var report = textbox.text
	textbox.text = ""
	var timestring = Time.get_datetime_string_from_system(false, true)
	var bug_report_data = {
		"username" = Attributes.username,
		"time" = timestring,
		"report" = report
	}
	(Attributes.database).insert_row("Bug_Reports", bug_report_data)
