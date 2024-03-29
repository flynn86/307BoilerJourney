extends Node2D

@onready var username_entry = $LineEdit

func _on_button_pressed():
	if username_entry.text == "":
		$Label.text = "You must enter a username before proceeding to character customization."
		$Label.visible = true
	else:
		Attributes.username = username_entry.text
		if ((Attributes.database).select_rows("Players", "username = '" + Attributes.username + "'", ["*"])):
			$Label.text = "Username taken."
			$Label.visible = true
		else:
			var data = {
				"username" = Attributes.username,
				"xp" = 0,
				"serverName" = "",
				"isHost" = false
			}
			(Attributes.database).insert_row("Players", data)
			get_tree().change_scene_to_file("res://characters/select_avatar.tscn")

func _on_button_2_pressed():
	if username_entry.text == "":
		$Label.text = "You must enter a username before proceeding to character customization."
		$Label.visible = true
	else:
		Attributes.username = username_entry.text
		if ((Attributes.database).select_rows("Players", "username = '" + Attributes.username + "'", ["*"])):
			$Label.text = "Username taken."
			$Label.visible = true
		else:
			var data = {
				"username" = Attributes.username,
				"xp" = 0
			}
			(Attributes.database).insert_row("Players", data)
			get_tree().change_scene_to_file("res://characters/select_avatar.tscn")
