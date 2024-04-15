extends Node2D

func _on_back_to_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_dm_button_pressed():
	Attributes.dm_temp = $DMUser.text
	get_tree().change_scene_to_file("res://scenes/direct_message.tscn")

func _on_gc_button_pressed():
	Attributes.gc_temp = $GCUsers.text
	get_tree().change_scene_to_file("res://scenes/group_chat.tscn")
