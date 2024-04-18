extends Node2D

var next_quests = false

func _on_back_to_map_pressed():
	get_tree().change_scene_to_file(Attributes.location)

func _process(delta):
	if !next_quests:
		if Attributes.quest1_active and !Attributes.quest1_completed:
			$Panel/StartQuest1.visible = false
			$Panel/Quest1Status.visible = true
		elif !Attributes.quest1_active and Attributes.quest1_completed:
			$Panel/StartQuest1.visible = false
			$Panel/Quest1Status.visible = true
			$Panel/Quest1Status.text = "Completed"
		else:
			$Panel/StartQuest1.visible = true
			$Panel/Quest1Status.visible = false
		
		if Attributes.quest2_active and !Attributes.quest2_completed:
			$Panel/StartQuest2.visible = false
			$Panel/Quest2Status.visible = true
		elif !Attributes.quest2_active and Attributes.quest2_completed:
			$Panel/StartQuest2.visible = false
			$Panel/Quest2Status.visible = true
			$Panel/Quest2Status.text = "Completed"
		else:
			$Panel/StartQuest2.visible = true
			$Panel/Quest2Status.visible = false
		
		if Attributes.quest3_active and !Attributes.quest3_completed:
			$Panel/StartQuest3.visible = false
			$Panel/Quest3Status.visible = true
		elif !Attributes.quest3_active and Attributes.quest3_completed:
			$Panel/StartQuest3.visible = false
			$Panel/Quest3Status.visible = true
			$Panel/Quest3Status.text = "Completed"
		else:
			$Panel/StartQuest3.visible = true
			$Panel/Quest3Status.visible = false
		
		if Attributes.quest3_active and Attributes.numCollected >= 3:
			$Panel/StartQuest3.visible = false
			$Panel/Quest3Status.visible = true
			$Panel/Quest3Status.text = "Completed"
	else:
		if Attributes.quest4_active and !Attributes.quest4_completed:
			$Panel/StartQuest4.visible = false
			$Panel/Quest4Status.visible = true
		elif !Attributes.quest4_active and Attributes.quest4_completed:
			$Panel/StartQuest4.visible = false
			$Panel/Quest4Status.visible = true
			$Panel/Quest4Status.text = "Completed"
		else:
			$Panel/StartQuest4.visible = true
			$Panel/Quest4Status.visible = false
		
		if Attributes.quest5_active and !Attributes.quest5_completed:
			$Panel/StartQuest5.visible = false
			$Panel/Quest5Status.visible = true
		elif !Attributes.quest5_active and Attributes.quest5_completed:
			$Panel/StartQuest5.visible = false
			$Panel/Quest5Status.visible = true
			$Panel/Quest5Status.text = "Completed"
		else:
			$Panel/StartQuest5.visible = true
			$Panel/Quest5Status.visible = false
		
		if Attributes.quest6_active and !Attributes.quest6_completed:
			$Panel/StartQuest6.visible = false
			$Panel/Quest6Status.visible = true
		elif !Attributes.quest6_active and Attributes.quest6_completed:
			$Panel/StartQuest6.visible = false
			$Panel/Quest6Status.visible = true
			$Panel/Quest6Status.text = "Completed"
		else:
			$Panel/StartQuest6.visible = true
			$Panel/Quest6Status.visible = false


func _on_start_quest_1_pressed():
	Attributes.quest1_active = true
	Attributes.engineering_ftn_visited = false
	Attributes.loeb_ftn_visited = false

func _on_start_quest_2_pressed():
	Attributes.quest2_active = true

func _on_start_quest_3_pressed():
	Attributes.quest3_active = true

func _on_start_quest_4_pressed():
	Attributes.quest4_active = true

func _on_start_quest_5_pressed():
	Attributes.quest5_active = true

func _on_start_quest_6_pressed():
	Attributes.quest6_active = true

func _on_to_next_quests_pressed():
	next_quests = true
	$Panel/QuestLabel1.visible = false
	$Panel/QuestLabel2.visible = false
	$Panel/QuestLabel3.visible = false
	$Panel/StartQuest1.visible = false
	$Panel/StartQuest2.visible = false
	$Panel/StartQuest3.visible = false
	$Panel/Quest1Status.visible = false
	$Panel/Quest2Status.visible = false
	$Panel/Quest3Status.visible = false
	$Panel/QuestLabel4.visible = true
	$Panel/QuestLabel5.visible = true
	$Panel/QuestLabel6.visible = true
	$Panel/ToNextQuests.visible = false
	$Panel/ToPrevQuests.visible = true


func _on_to_prev_quests_pressed():
	next_quests = false
	$Panel/QuestLabel1.visible = true
	$Panel/QuestLabel2.visible = true
	$Panel/QuestLabel3.visible = true
	$Panel/QuestLabel4.visible = false
	$Panel/QuestLabel5.visible = false
	$Panel/QuestLabel6.visible = false
	$Panel/StartQuest4.visible = false
	$Panel/StartQuest5.visible = false
	$Panel/StartQuest6.visible = false
	$Panel/Quest4Status.visible = false
	$Panel/Quest5Status.visible = false
	$Panel/Quest6Status.visible = false
	$Panel/ToNextQuests.visible = true
	$Panel/ToPrevQuests.visible = false
