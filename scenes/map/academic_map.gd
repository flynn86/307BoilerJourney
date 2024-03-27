extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$CharacterBody2D.global_position = Vector2(float(Attributes.xacademic),float(Attributes.yacademic))
	get_node("SummerVariantA").visible = false
	get_node("FallVariantA").visible = false
	get_node("SpringVariantA").visible = false
	get_node("WinterVariantA").visible = false
	if (Attributes.season == "Summer"):
		get_node("SummerVariantA").visible = true
	elif (Attributes.season == "Fall"):
		get_node("FallVariantA").visible = true
	elif (Attributes.season == "Spring"):
		get_node("SummerVariantA").visible = true
		get_node("SpringVariantA").visible = true
	elif (Attributes.season == "Winter"):
		get_node("WinterVariantA").visible = true
	if (Attributes.night):
		get_node("day_night").set_time_state(1)
		get_node("CharacterBody2D/Player/player_light").visible = true
	get_node("CharacterBody2D/Player/CollectibleButton").visible = !Attributes.collectibleA
	set_process_input(true)
	get_node("Purdue_symbol").visible = !Attributes.purdue_symbol
	get_node("IU_Sucks_Poster").visible = !Attributes.iu_poster
	get_node("basketball").visible = !Attributes.basketball

func _input(event):
	if event is InputEventMouseMotion or event is InputEventMouseButton:
		var mouse_pos = event.position

func _on_Area2D_input_event(viewport, event, shape_idx, build_name: String):
	if event is InputEventScreenTouch and event.pressed:
		Attributes.xacademic = $CharacterBody2D.global_position.x
		Attributes.yacademic = $CharacterBody2D.global_position.y
		open_tab(build_name)
	elif event is InputEventMouseButton and event.pressed:
		Attributes.xacademic = $CharacterBody2D.global_position.x
		Attributes.yacademic = $CharacterBody2D.global_position.y
		open_tab(build_name)

func open_tab(building_name: String):
	Attributes.xacademic = $CharacterBody2D.global_position.x
	Attributes.yacademic = $CharacterBody2D.global_position.y
	if building_name == "PMU":
		get_tree().change_scene_to_file("res://scenes/PMU_scene/pmu_scene.tscn")
	else: 
		var file = FileAccess.open("res://location_information/building_name.txt", FileAccess.WRITE)
		file.store_string(building_name)
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
	Attributes.season = "Summer"
	get_node("SummerVariantA").visible = true
	get_node("FallVariantA").visible = false
	get_node("SpringVariantA").visible = false
	get_node("WinterVariantA").visible = false

func _on_change_winter_pressed():
	Attributes.season = "Winter"
	get_node("SummerVariantA").visible = false
	get_node("FallVariantA").visible = false
	get_node("SpringVariantA").visible = false
	get_node("WinterVariantA").visible = true


func _on_change_fall_pressed():
	Attributes.season = "Fall"
	get_node("SummerVariantA").visible = false
	get_node("FallVariantA").visible = true
	get_node("SpringVariantA").visible = false
	get_node("WinterVariantA").visible = false


func _on_change_spring_pressed():
	Attributes.season = "Spring"
	get_node("SummerVariantA").visible = true
	get_node("FallVariantA").visible = false
	get_node("SpringVariantA").visible = true
	get_node("WinterVariantA").visible = false


func _on_day_night_button_pressed():
	var temp = get_node("day_night")
	var temp2 = get_node("CharacterBody2D/Player/player_light")
	if (temp.get_time_state() == 0):
		Attributes.night = true;
		temp.set_time_state(1)
		temp2.visible = true
	else:
		Attributes.night = false;
		temp.set_time_state(0)
		temp2.visible = false



func _on_menu_button_pressed():
	Attributes.xacademic = $CharacterBody2D.global_position.x
	Attributes.yacademic = $CharacterBody2D.global_position.y
	SaveUtils.save()
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_collectible_button_pressed():
	Attributes.collectibleA = true
	get_node("CharacterBody2D/Player/CollectibleButton").visible = false


func _on_questlog_button_pressed():
	Attributes.xacademic = $CharacterBody2D.global_position.x
	Attributes.yacademic = $CharacterBody2D.global_position.y
	SaveUtils.save()
	get_tree().change_scene_to_file("res://scenes/quests/quest_log.tscn")


func _on_engineering_fountain_body_entered(body):
	if (body.name == "CharacterBody2D"):
		Attributes.engineering_ftn_visited = true


func _on_loeb_fountain_body_entered(body):
	if (body.name == "CharacterBody2D"):
		Attributes.loeb_ftn_visited = true

func _on_bell_tower_body_entered(body):
	if (body.name == "CharacterBody2D" and Attributes.quest2_active):
		$RingBellTower.visible = true

func _on_bell_tower_body_exited(body):
	if (body.name == "CharacterBody2D"):
		$RingBellTower.visible = false

func _on_ring_bell_tower_pressed():
	Attributes.quest2_active = false
	Attributes.quest2_completed = true
	$RingBellTower.visible = false
	$BellTowerSound.play()

func _process(delta):
	if (Attributes.quest1_active):
		if (Attributes.engineering_ftn_visited == true and Attributes.loeb_ftn_visited == true):
			Attributes.quest1_completed = true
			Attributes.quest1_active = false


func _on_view_schedule_pressed():
	get_tree().change_scene_to_file("res://scenes/schedule.tscn")
	

func _on_inventory_pressed():
	Attributes.xacademic = $CharacterBody2D.global_position.x
	Attributes.yacademic = $CharacterBody2D.global_position.y
	SaveUtils.save()
	get_tree().change_scene_to_file("res://scenes/Inventory/player_inventory.tscn")
