extends Node2D

func _on_start_new_game_pressed():
	SaveUtils.initialize_game()
	
	# Placeholder for changing to Map scene
	get_tree().change_scene_to_file("res://scenes/location_page.tscn")


func _on_load_game_pressed():
	SaveUtils.load()
	
	# Placeholder for changing to Map scene
	get_tree().change_scene_to_file("res://scenes/location_page.tscn")


