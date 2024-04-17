extends Node2D

func _ready():
	$CharacterBody2D.global_position = Vector2(float(Attributes.xhousing),float(Attributes.yhousing))
	get_node("SummerVariantH").visible = false
	get_node("FallVariantH").visible = false
	get_node("SpringVariantH").visible = false
	get_node("WinterVariantH").visible = false
	if (Attributes.season == "Summer"):
		get_node("SummerVariantH").visible = true
	elif (Attributes.season == "Fall"):
		get_node("FallVariantH").visible = true
	elif (Attributes.season == "Spring"):
		get_node("SummerVariantH").visible = true
		get_node("SpringVariantH").visible = true
	elif (Attributes.season == "Winter"):
		get_node("WinterVariantH").visible = true
	get_node("Inventory_container").visible = false
	get_node("Trivia_container").visible = false
	set_process_input(true)
	get_node("CharacterBody2D/Panel2").visible = false
	$CharacterBody2D/Panel.visible = false
	
	get_node("basketball").visible = !Attributes.basketball
	get_node("boilermaker_train").visible = !Attributes.boilermaker_train
	get_node("purdue_helmet").visible = !Attributes.purdue_helmet
	get_node("purdue_cap").visible = !Attributes.purdue_cap
	get_node("CharacterBody2D/Player/view_suggestions").visible = false
	get_node("Inventory_container").visible = false
	get_node("Trivia_container").visible = false

func _on_panel_closed():
	Attributes.xhousing = $CharacterBody2D.global_position.x
	Attributes.yhousing = $CharacterBody2D.global_position.y
	SaveUtils.save()
	self.visible = true

func _on_return_button_pressed():
	Attributes.xhousing = $CharacterBody2D.global_position.x
	Attributes.yhousing = $CharacterBody2D.global_position.y
	Attributes.location = "res://scenes/map/academic_map.tscn"
	get_tree().change_scene_to_file("res://scenes/map/academic_map.tscn")
	SaveUtils.save()


func _on_change_summer_pressed():
	Attributes.season = "Summer"
	get_node("SummerVariantH").visible = true
	get_node("FallVariantH").visible = false
	get_node("SpringVariantH").visible = false
	get_node("WinterVariantH").visible = false



func _on_change_winter_pressed():
	Attributes.season = "Winter"
	get_node("SummerVariantH").visible = false
	get_node("FallVariantH").visible = false
	get_node("SpringVariantH").visible = false
	get_node("WinterVariantH").visible = true


func _on_change_fall_pressed():
	Attributes.season = "Fall"
	get_node("SummerVariantH").visible = false
	get_node("FallVariantH").visible = true
	get_node("SpringVariantH").visible = false
	get_node("WinterVariantH").visible = false


func _on_change_spring_pressed():
	Attributes.season = "Spring"
	get_node("SummerVariantH").visible = true
	get_node("FallVariantH").visible = false
	get_node("SpringVariantH").visible = true
	get_node("WinterVariantH").visible = false


func _on_menu_button_pressed():
	Attributes.xhousing = $CharacterBody2D.global_position.x
	Attributes.yhousing = $CharacterBody2D.global_position.y
	Attributes.location = "res://scenes/map/housing_map.tscn"	
	SaveUtils.save()
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_questlog_button_pressed():
	Attributes.xhousing = $CharacterBody2D.global_position.x
	Attributes.yhousing = $CharacterBody2D.global_position.y
	Attributes.location = "res://scenes/map/housing_map.tscn"	
	SaveUtils.save()
	get_tree().change_scene_to_file("res://scenes/quests/quest_log.tscn")

func _process(delta):
	if (Attributes.quest3_active):
		if (Attributes.numCollected >= 3):
			Attributes.quest3_completed = true
			Attributes.quest3_active = false
			Attributes.xp = Attributes.xp + 15
			(Attributes.database).update_rows("Players", "username = '" + Attributes.username + "'", {"xp": Attributes.xp})
	if Attributes.xp <= 29:
		Attributes.rank = "Freshman"
	elif Attributes.xp <= 59: 
		if (Attributes.rank != "Sophomore"):
			get_node("CharacterBody2D/Panel2").visible = true
		Attributes.rank = "Sophomore"
	elif Attributes.xp <= 89:
		if (Attributes.rank != "Junior"):
			get_node("CharacterBody2D/Panel2").visible = true
		Attributes.rank = "Junior"
	else: 
		if (Attributes.rank != "Senior"):
			get_node("CharacterBody2D/Panel2").visible = true
		Attributes.rank = "Senior"

func _on_view_schedule_pressed():
	Attributes.xhousing = $CharacterBody2D.global_position.x
	Attributes.yhousing = $CharacterBody2D.global_position.y
	Attributes.location = "res://scenes/map/housing_map.tscn"
	SaveUtils.save()
	get_tree().change_scene_to_file("res://scenes/schedule.tscn")

func _on_inventory_pressed():
	Attributes.xhousing = $CharacterBody2D.global_position.x
	Attributes.yhousing = $CharacterBody2D.global_position.y
	Attributes.location = "res://scenes/map/housing_map.tscn"
	SaveUtils.save()
	get_tree().change_scene_to_file("res://scenes/Inventory/player_inventory.tscn")

func _on_daily_trivia_pressed():
	Attributes.xhousing = $CharacterBody2D.global_position.x
	Attributes.yhousing = $CharacterBody2D.global_position.y
	Attributes.location = "res://scenes/map/housing_map.tscn"
	SaveUtils.save()
	get_tree().change_scene_to_file("res://scenes/daily_trivia/daily_trivia.tscn")

func _on_dorm_pressed():
	Attributes.xhousing = $CharacterBody2D.global_position.x
	Attributes.yhousing = $CharacterBody2D.global_position.y
	Attributes.location = "res://scenes/map/housing_map.tscn"
	SaveUtils.save()
	get_tree().change_scene_to_file("res://scenes/map/dorm_room.tscn")
	
func _on_close_variants_pressed():
	get_node("CharacterBody2D/Panel").visible = false

func _on_variants_pressed():
	$CharacterBody2D/Panel.visible = true
	
func _on_rank_pressed(): 
	Attributes.xhousing = $CharacterBody2D.global_position.x
	Attributes.yhousing = $CharacterBody2D.global_position.y
	Attributes.location = "res://scenes/map/housing_map.tscn"
	SaveUtils.save()
	get_tree().change_scene_to_file("res://scenes/rank_page/rank_page.tscn")

func _on_noti_close_pressed():
	get_node("CharacterBody2D/Panel2").visible = false
	
func _on_day_night_pressed():
	Attributes.day_night_enabled = ! Attributes.day_night_enabled

func _on_suggestions_pressed():
	get_node("CharacterBody2D/Player/view_suggestions").visible = true

func _on_close_pressed():
	get_node("CharacterBody2D/Player/view_suggestions").visible = false


func _on_friends_list_pressed():
	Attributes.xhousing = $CharacterBody2D.global_position.x
	Attributes.yhousing = $CharacterBody2D.global_position.y
	Attributes.location = "res://scenes/map/housing_map.tscn"	
	SaveUtils.save()
	get_tree().change_scene_to_file("res://scenes/friends_list/friends_list.tscn")
	
func _on_trans_close_pressed():
	get_node("CharacterBody2D/transportation_panel").visible = false

func _on_bus_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch and event.pressed:
		get_node("CharacterBody2D/transportation_panel").visible = true
	elif event is InputEventMouseButton and event.pressed:
		get_node("CharacterBody2D/transportation_panel").visible = true

func _on_bus_button_pressed(extra_arg_0):
	if (extra_arg_0 == "phys"):
		$CharacterBody2D.global_position.x = 2113.241699
		$CharacterBody2D.global_position.y = -5078.95214
	elif (extra_arg_0 =="army"):
		$CharacterBody2D.global_position.x = -930.07617187
		$CharacterBody2D.global_position.y = -2398.39624023438
	elif (extra_arg_0 =="matt"):
		$CharacterBody2D.global_position.x = -937.063659667969
		$CharacterBody2D.global_position.y =  2190.18359375
	elif (extra_arg_0 =="push"):
		$CharacterBody2D.global_position.x = -820.384765
		$CharacterBody2D.global_position.y = -5648.923828
	elif (extra_arg_0 =="pmu"):
		$CharacterBody2D.global_position.x = 3122.93627929688
		$CharacterBody2D.global_position.y = 3090.18359375
	elif (extra_arg_0 =="ece"):
		$CharacterBody2D.global_position.x = 3758.2416
		$CharacterBody2D.global_position.y = -3423.9521
	get_node("CharacterBody2D/transportation_panel").visible = false
