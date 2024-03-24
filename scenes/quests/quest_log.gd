extends Node2D


func _on_back_to_map_pressed():
	get_tree().change_scene_to_file(Attributes.location)

func _process(delta):
	if Attributes.quest1_active and !Attributes.quest1_completed:
		$StartQuest1.visible = false
		$Quest1Status.visible = true
	elif !Attributes.quest1_active and Attributes.quest1_completed:
		$StartQuest1.visible = false
		$Quest1Status.visible = true
		$Quest1Status.text = "Completed"
	else:
		$StartQuest1.visible = true
		$Quest1Status.visible = false
	
	if Attributes.quest2_active and !Attributes.quest2_completed:
		$StartQuest2.visible = false
		$Quest2Status.visible = true
	elif !Attributes.quest2_active and Attributes.quest2_completed:
		$StartQuest2.visible = false
		$Quest2Status.visible = true
		$Quest2Status.text = "Completed"
	else:
		$StartQuest2.visible = true
		$Quest2Status.visible = false
	
	if Attributes.quest3_active and !Attributes.quest3_completed:
		$StartQuest3.visible = false
		$Quest3Status.visible = true
	elif !Attributes.quest3_active and Attributes.quest3_completed:
		$StartQuest3.visible = false
		$Quest3Status.visible = true
		$Quest3Status.text = "Completed"
	else:
		$StartQuest3.visible = true
		$Quest3Status.visible = false
	
	
	if Attributes.quest3_active and Attributes.numCollected >= 3:
		Attributes.quest3_active = false
		Attributes.quest3_completed = true
		print("15XP added to player")


func _on_start_quest_1_pressed():
	Attributes.quest1_active = true
	Attributes.engineering_ftn_visited = false
	Attributes.loeb_ftn_visited = false


func _on_start_quest_2_pressed():
	Attributes.quest2_active = true


func _on_start_quest_3_pressed():
	Attributes.quest3_active = true
