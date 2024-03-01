extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
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
