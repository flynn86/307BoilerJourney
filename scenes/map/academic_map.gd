extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
#var x = float(-855.100219726562)
#var y = float(-1381.95544433594)
	$CharacterBody2D.global_position = Vector2(float(Attributes.xacademic),float(Attributes.yacademic))
	set_process_input(true)

func _input(event):
	if event is InputEventMouseMotion or event is InputEventMouseButton:
		var mouse_pos = event.position

func _on_Area2D_input_event(viewport, event, shape_idx, build_name: String):
	if event is InputEventScreenTouch and event.pressed:
		open_tab(build_name)
	elif event is InputEventMouseButton and event.pressed:
		open_tab(build_name)

func open_tab(building_name: String):
	var text_path1 = "res://scenes/map/char_pos_academic.txt"
	if FileAccess.file_exists(text_path1):
		var file = FileAccess.open(text_path1, FileAccess.WRITE)
		var position_string = str($CharacterBody2D.global_position.x) + ", " + str($CharacterBody2D.global_position.y)
		file.store_string(position_string)
		file.close()
	if building_name == "PMU":
		get_tree().change_scene_to_file("res://scenes/PMU_page/pmu_panel.tscn")
	else: 
		var text_path = "res://location_information/loc_text/DISPLAY_NAME.txt"
		if FileAccess.file_exists(text_path):
			var file = FileAccess.open(text_path, FileAccess.WRITE)
			file.store_string(building_name)
			file.close()
		get_tree().change_scene_to_file("res://scenes/location_tab/location_page.tscn")
	
func _on_panel_closed():
	Attributes.xacademic = $CharacterBody2D.global_position.x
	Attributes.yacademic = $CharacterBody2D.global_position.y
	SaveUtils.save()
	self.visible = true
	
func _on_housing_button_pressed():
	Attributes.xacademic = $CharacterBody2D.global_position.x
	Attributes.yacademic = $CharacterBody2D.global_position.y
	Attributes.location = "res://scenes/map/housing_map.tscn"
	get_tree().change_scene_to_file("res://scenes/map/housing_map.tscn")
	SaveUtils.save()


func _on_change_summer_pressed():
	get_node("SummerVariantA").visible = true
	get_node("FallVariantA").visible = false
	get_node("SpringVariantA").visible = false
	get_node("WinterVariantA").visible = false



func _on_change_winter_pressed():
	get_node("SummerVariantA").visible = false
	get_node("FallVariantA").visible = false
	get_node("SpringVariantA").visible = false
	get_node("WinterVariantA").visible = true


func _on_change_fall_pressed():
	get_node("SummerVariantA").visible = false
	get_node("FallVariantA").visible = true
	get_node("SpringVariantA").visible = false
	get_node("WinterVariantA").visible = false


func _on_change_spring_pressed():
	get_node("SummerVariantA").visible = true
	get_node("FallVariantA").visible = false
	get_node("SpringVariantA").visible = true
	get_node("WinterVariantA").visible = false


func _on_day_night_button_pressed():
	var temp = get_node("day_night")
	var temp2 = get_node("CharacterBody2D/Player/player_light")
	if (temp.get_time_state() == 0):
		temp.set_time_state(1)
		temp2.visible = true
	else:
		temp.set_time_state(0)
		temp2.visible = false

