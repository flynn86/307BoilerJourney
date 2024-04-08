extends Node2D

@onready var username_entry = $LineEdit

func _on_button_pressed():
	var data = {
		"username" = Attributes.username,
		"xp" = 0,
		"rank" = "Freshman",
		"serverName" = "",
		"isHost" = false
	}
	(Attributes.database).insert_row("Players", data)
	get_tree().change_scene_to_file("res://characters/select_avatar.tscn")

func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://characters/customized_character.tscn")
