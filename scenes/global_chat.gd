extends Node2D


func _ready():
	$Label.text = str((Attributes.database).select_rows("GlobalChat", "username != 'null'", ["*"]))
	print((Attributes.database).select_rows("GlobalChat", "username != 'null'", ["*"]))

func _on_send_message_pressed():
	var data = {
		"username" = Attributes.username,
		"message" = $LineEdit.text,
		"time_date" = Time.get_datetime_string_from_system()
	}
	(Attributes.database).insert_row("GlobalChat", data)
	_ready()


func _on_back_to_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
