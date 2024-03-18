extends Node2D

func _ready():
	if Attributes.PMU_renter == true:
		$CharacterBody2D.global_position = Vector2(float(Attributes.xPMU),float(Attributes.yPMU))
		$CharacterBody2D/clubs_popup.hide()
		$CharacterBody2D/games_popup.hide()
	else: 
		$CharacterBody2D.global_position.x = float(3250)
		$CharacterBody2D.global_position.y = float(830)
		$CharacterBody2D/Popup.show()

func _input(event):
	if event is InputEventMouseMotion or event is InputEventMouseButton:
		var mouse_pos = event.position

func _on_menu_button_pressed():
	Attributes.xPMU = $CharacterBody2D.global_position.x
	Attributes.yPMU= $CharacterBody2D.global_position.y
	SaveUtils.save()
	Attributes.location = "res://scenes/PMU_scene/pmu_scene.tscn"
	Attributes.PMU_renter = true
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

func _on_exit_button_pressed():
	Attributes.PMU_renter = false
	Attributes.location = "res://scenes/map/academic_map.tscn"
	SaveUtils.save()
	get_tree().change_scene_to_file("res://scenes/map/academic_map.tscn")
	
func _on_close_button_pressed():
	$CharacterBody2D/Popup.hide()
	$CharacterBody2D/clubs_popup.hide()
	$CharacterBody2D/games_popup.hide()

func _on_clubs_pressed():
	Attributes.xPMU = $CharacterBody2D.global_position.x
	Attributes.yPMU= $CharacterBody2D.global_position.y
	Attributes.PMU_renter = true
	get_tree().change_scene_to_file("res://scenes/club_page/club_page.tscn")

func _on_games_pressed():
	Attributes.xPMU = $CharacterBody2D.global_position.x
	Attributes.yPMU= $CharacterBody2D.global_position.y
	Attributes.PMU_renter = true
	get_tree().change_scene_to_file("res://scenes/games_page/game_page.tscn")

func _on_club_area_entered(area_rid, area, area_shape_index, local_shape_index):
	$CharacterBody2D/clubs_popup.show()

func _on_games_area_entered(area):
	$CharacterBody2D/games_popup.show()

