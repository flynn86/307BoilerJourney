extends Node2D

@onready var username_entry = $LineEdit

func _on_button_pressed():
	if username_entry.text == "":
		$Label.visible = true
	else:
		Attributes.username = username_entry.text
		var data = {
			"username" = Attributes.username,
			"xp" = 0
		}
#		(Attributes.database).insert_row("Players", data)
		get_tree().change_scene_to_file("res://characters/select_avatar.tscn")

func _on_button_2_pressed():
	if username_entry.text == "":
		$Label.visible = true
	else:
		Attributes.username = username_entry.text
		var data = {
			"username" = Attributes.username,
			"xp" = 0
		}
		(Attributes.database).insert_row("Players", data)
		get_tree().change_scene_to_file("res://characters/Player.tscn")
