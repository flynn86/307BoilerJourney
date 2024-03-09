extends Node2D

func _on_button_pressed():
	if Attributes.username == "":
		$Label.visible = true
	else:
		get_tree().change_scene_to_file("res://characters/select_avatar.tscn")


func _on_button_2_pressed():
	if Attributes.username == "":
		$Label.visible = true
	else:
		get_tree().change_scene_to_file("res://characters/Player.tscn")


func _on_line_edit_text_changed(new_text):
	Attributes.username = new_text
