extends Panel

func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/map/academic_map.tscn")
	
func _on_game_button_pressed():
	get_tree().change_scene_to_file("res://scenes/games_page/game_page.tscn")
	
func _on_club_button_pressed():
	get_tree().change_scene_to_file("res://scenes/club_page/club_page.tscn")
