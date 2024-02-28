extends Node2D

func _on_start_new_game_pressed():
	# Placeholder for changing to Map scene
	get_tree().change_scene_to_file("res://scenes/map/academic_map.tscn")


func _on_load_game_pressed():
	SaveUtils.load()
	
	# Placeholder for changing to Map scene
	if (Attributes.location == Attributes.Location.HOUSING):
		get_tree().change_scene_to_file("res://scenes/map/housing_map.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/map/academic_map.tscn")
	


