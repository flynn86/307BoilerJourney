extends Node2D




func _on_button_pressed():
	get_tree().change_scene_to_file("res://characters/select_avatar.tscn")


func _on_button_2_pressed():
		get_tree().change_scene_to_file("res://characters/Player.tscn")