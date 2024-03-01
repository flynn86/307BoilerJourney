extends Node2D

func _on_save_progress_button_pressed():
	SaveUtils.save()


func _on_view_progress_button_pressed():
	get_tree().change_scene_to_file("res://scenes/progress_page.tscn")


func _on_back_to_map_button_pressed():
	get_tree().change_scene_to_file("res://scenes/map/housing_map.tscn")


func _on_back_to_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://scenes/map/main_menu.tscn")


func _on_customize_character_button_pressed():
	get_tree().change_scene_to_file("res://scenes/map/character_built.tscn")
