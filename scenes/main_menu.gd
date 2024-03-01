extends Node2D

func _on_start_new_game_pressed():
	get_tree().change_scene_to_file("res://characters/Player.tscn")

func _on_load_game_pressed():
	SaveUtils.load()
	get_tree().change_scene_to_file(Attributes.location)
